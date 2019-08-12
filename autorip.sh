#!/bin/bash

#close the cd tray
eject /dev/sr0 -t

#wait for dvd drive to load
while ! dd if=/dev/sr0 bs=2048 count=1 of=/dev/null 2>/dev/null; do sleep 1; done

#get the name of the dvd
DVD_NAME="$(blkid -o value -s LABEL /dev/sr0)"
DVD_NAME=${DVD_NAME// /}
echo "Dvd Name = $DVD_NAME"

#Rip the DVD only the main feature
dvdbackup -i /dev/sr0 -o ../storage/Movies/tmp/ -n $DVD_NAME -F #-t 1

#combine the .VOB files into one file
cat ../storage/Movies/tmp/$DVD_NAME/VIDEO_TS/*.VOB > ../storage/Movies/tmp/$DVD_NAME/$DVD_NAME.VOB

#transform the vob into a mkv
ffmpeg -i ../storage/Movies/tmp/$DVD_NAME/$DVD_NAME.VOB -c:v libx264 -preset fast -threads 4 -qp 14 -c:a copy ../storage/Movies/$DVD_NAME.mkv

#get rid of tmp
rm -rf ../storage/Movies/tmp

#remake tmp
mkdir ../storage/Movies/tmp

#eject dvd tray
eject /dev/sr0
