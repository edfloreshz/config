#!/bin/bash

getDevices() {
    sudo fdisk -l 2>&1 | grep EFI | grep -o "^\S*" | tail -3
}

echo "Select your Windows EFI partition:"
windows=""

select DEVICE in $(getDevices);
do
    case $DEVICE in
        "$QUIT")
            echo "Exiting"
            break
            ;;
        *)
            windows="$DEVICE"
            break
            ;;
    esac
done

echo "Select your Linux EFI partition:"
linux=""

select DEVICE in $(getDevices);
do
    case $DEVICE in
        "$QUIT")
            echo "Exiting"
            break
            ;;
        *)
            linux="$DEVICE"
            break
            ;;
    esac
done
echo Windows partition set to: $windows
echo Linux partition set to: $linux

if [ ! -d /mnt/win ] || [ ! -d /mnt/lnx ] 
then
    sudo mkdir /mnt/{win,lnx}
fi
sudo mount $windows /mnt/win
sudo mount $linux /mnt/lnx
sudo cp -R /mnt/win/EFI/Microsoft /mnt/lnx/EFI

echo Done! Now you can reboot...
