#!/bin/bash

# Usage: ./change_mac.sh <interface> [<new_mac_address>]

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <interface> [<new_mac_address>]"
    exit 1
fi

interface="$1"
new_mac="$2"

# Generate a random MAC address if not provided
if [ -z "$new_mac" ]; then
    new_mac=$(printf "00:16:3e:%02x:%02x:%02x" $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))
fi

# Check if the interface exists
if ! ip link show "$interface" &> /dev/null; then
    echo "Error: Interface $interface does not exist."
    exit 1
fi

# Disable the interface
ip link set "$interface" down

# Change the MAC address
ip link set dev "$interface" address "$new_mac"

# Re-enable the interface
ip link set "$interface" up

# Verify the change
current_mac=$(ip link show "$interface" | awk '/ether/ {print $2}')
if [ "$current_mac" = "$new_mac" ]; then
    echo "MAC address changed to $new_mac for $interface."
else
    echo "Error: Failed to change MAC address for $interface."
fi

