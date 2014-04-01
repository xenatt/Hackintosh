#!/bin/bash

#Recovery Hd Script Modified from http://rampagedev.wordpress.com/os-x-tweaks/how-to-create-a-recovery-partition-and-enable-all-features-of-icloud-and-imessages/ 
clear;
say "Hello"
echo 'Hello'
TMPSH="/tmp/recoverymake.sh"
MYPATH="$(dirname "$0")"
MNTPATH="/Volumes/Macosx_installer"
MAVPATH="/Applications/Install OS X Mavericks.app/Contents/SharedSupport/InstallESD.dmg"
MTLPATH="/Applications/Install OS X Mountain Lion.app/Contents/SharedSupport/InstallESD.dmg"
echo "Searching For OS X Mountain Lion and OS X Mavericks Installer in Applications's Folder"
say "Searching For OS X Mountain Lion and OS X Mavericks Installer in Applications's Folder"
if [ -f "$MAVPATH" ] 
	then	
		echo "OS X Maverick Installer Found." 
		echo "Create Recovery Hd Partition from OS X Maverick Installer"
		say "OS X Maverick Installer Found."
		say "Create Recovery Hd Partition from OS X Maverick Installer"
		DMGPATH="$MAVPATH"
elif [ -f "$MTLPATH" ]
	then
		echo "OS X Mountain Lion Installer Found."
		echo "Create Recovery Hd Partition from OS X Mountain Lion Installer"
		say "OS X Mountain Lion Installer Found."
		say "Create Recovery Hd Partition from OS X Mountain Lion Installer"
		DMGPATH="$MTLPATH" 
fi
if [ -f "$DMGPATH" ] 
	then 
		echo "Mount OS X installer image file."
		say "Mount OS X installer image file"
		hdiutil attach "$DMGPATH" -mountpoint "$MNTPATH" -noverify -nobrowse ;
	else 
		if [ "$(osascript -e 'set t to display dialog "OS X installer App Not Found. Download OS X Mavericks from App Store First" buttons {"Download", "Quite"}' | grep -c'Download')"  == 1 ] 
			then
				echo "Download Mac OS X Mavericks At https://itunes.apple.com/us/app/os-x-mavericks/id675248567?mt=12"
				osascript -e 'tell application "System Events"' -e 'open location "macappstores://itunes.apple.com/us/app/os-x-mavericks/id675248567?mt=12"' -e 'end tell'
				say "Open Mac App store. You Must Download OS X Mavericks Or OS X Mountain Lion First"
			else
				echo 'Good Bye'
				say 'Good Bye'
				E=`osascript -e 'set theDialg to (display dialog "Good Bye" buttons {"OK"})'`
		fi
		exit
fi
#get destination drive
DEST=`osascript -e 'do shell script "ls /Volumes/"' -e 'set _Result to the paragraphs of result' -e 'set theVolumeTemp to (choose from list _Result with prompt "DESTINATION disk for Recovery HD partition: " without empty selection allowed)' -e 'if theVolumeTemp is false then return' -e 'set theVolume to "/Volumes/" & theVolumeTemp & "/"'`
#Apple Script Form http://macscripter.net/viewtopic.php?id=25755
if [ ! -d "$DEST" ]
	then 
		echo 'This Volumes not found'
		say "Error to define Target Volume for make Recovery HD Partition"
		X=`osascript -e 'set theDialg to (display dialog "This Volumes not found." buttons {"OK"})'`
		exit
fi
clear

echo "Creating Recovery Hd Partitionin progress."
echo "Enter Password in Terminal and Please Wait..."
say "Create Recovery HD Partition in progress. Enter Password in Terminal and Please Wait"
sudo "$MYPATH"/dmtest ensureRecoveryPartition "$DEST" "$MNTPATH"/BaseSystem.dmg 0 0 "$MNTPATH"/BaseSystem.chunklist

echo "Process Complete..."
echo "Checking Recovery HD..."
umount $MNTPATH
say 'Unmount Exists image file from system'; 
echo 'Unmount Exists image file from system';

say 'Good Bye';
echo 'Good Bye'
		
