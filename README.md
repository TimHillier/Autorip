# Autorip
Simple script to automate the ripping of DVDs. Nothing to complicated as I just wanted something simple. All it currently does is rip it to VOB and convert to .mkv. 

### Requirments
The packages needed to run this are;
```
-dvdbackup
-ffmpeg
```
You can get these from your local package supplier.

### How to use
If you want to use this script yourself you'll want to change the paths to where you want the .mkv stored. You might also have to change the device name for the dvd drive. For me this was "/dev/sr0" but for you it might be different. use:
```
$lsblk
```
and it should be the drive with type "rom". 

### Future Improvements
A few ideas on how I would improve the script:
```
- let the user rename if theyre not happy with the default file name
- let the user input a different quality in "-qp 14". The lower the number the better the quality. But for dvds it seems like the 10-18 range works well enough.
- Maybe make it work for tv shows. Because currently it only takes the first one it finds. This fix works around the "dvdbackup" line on 14.
- Change how it treats the tmp folder. Currently it just deletes it and makes a new directory. This is probably not the best way to do this.
```
