# mac_cahnger
This script will automates the process of changing the MAC address of a network interface on a Linux system.
Please note that you need to have administrative privileges (usually root or sudo) to change the MAC address.
Save this script to a file, such as mac_changer.sh, and make it executable with chmod +x mac_chnager.sh.
To use the script, provide the network interface you want to change the MAC address for as the first argument and an optional new MAC address as the second argument. If you don't provide a new MAC address, the script will generate a random one.
For example, to change the MAC address of your Wi-Fi interface (e.g., wlan0) to a random address, you can run:sudo ./mac_chnager.sh wlan0
