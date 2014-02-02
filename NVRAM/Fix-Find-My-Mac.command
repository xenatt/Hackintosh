#!/bin/bash

echo "******************************************************************************************************************************************************"
echo "*                                             Starting Fix \"Find My Mac\".                                                                            *";say "Starting Fix Find My Mac.";
echo "*                                             Version 2.0                                                                                            *"
echo "******************************************************************************************************************************************************"
echo "*                                             Support Only For Hackintosh Not for generic Mac                                                        *"
echo "*                                             Copy Right Reserve GNU/GPL                                                                             *"
echo "*                                             By Nattapaong Pullkhow ( @xenatt )                                                                     *"
echo "******************************************************************************************************************************************************"

if [ $(nvram -p | grep -c 'fmm-mobileme-token') -eq 0 ] 
	then
		say "You are not Enable Find My Mac in System Preferences. Please Enable Find My Mac in System Preferences First"
		echo "You are not Enable Find My Mac in System Preferences. Please Enable Find My Mac in System Preferences First"
		DLG=`osascript -e 'display dialog "You are not Enable \"Find My Mac\" in System Preferences.Please Enable \"Find My Mac\" in System Preferences First." buttons {"Open iCloud Preferences", "Close"}'`
		if [ $(echo $DLG | grep -c "Open iCloud Preferences") -eq 1 ]
			then 
			osascript -e 'tell application "System Preferences" to activate'
			say "After you enable Find My Mac in System Preferences. Click Continue for Fix Find My Mac on your system."
			echo "After you enable Find My Mac in System Preferences. Click Continue for Fix Find My Mac on your system."
			DLG=`osascript -e 'display dialog "After you enble \"Find My Mac\" in System Preferences. Please Click \"Continue\" for Fix \"Find My Mac\" on your system." buttons {"Continue","close"}'`
			if [ $(echp $DLG) -eq "close" ]
				then
				say "Good bye"
				echo "Good Bye"
				exit
			fi
		fi
fi

if [ $(nvram -p | grep -c 'fmm-mobileme-token-FMM') -eq 0 ] 
	then 
	echo "You Not Enable \"Find My Mac\". Fix it and Run Fix \"Find My Mac\" Later."
	say "You Not Enable Find My Mac. Fix it and Run Fix Find My Mac Later."
	exit
fi 
if [ ! -f /nvram.plist ]
	then
	if [ $(nvram -p | grep -c 'fmm-mobileme-token-FMM') -eq 1 ]
		then
			echo "Your System not fix \"Find My Mac\". Do you want to Fix \"Find My Mac\""
			say "Your System not fix Find My Mac. Do you want to Fix Find My Mac"
			DLG=`osascript -e 'display dialog "Your System not fix \"Find My Mac\". Do you want to Fix \"Find My Mac\"?" buttons {"Fix it", "Close"}'`
			if [ $(echo $DLG | grep -c "Fix it") -eq 1 ]
				then
					say "*Setting Config.";say "Setting Config."	
					X=`osascript -e 'do shell script "sudo nvram -xp > /tmp/nvram;sudo cp -r /tmp/nvram /nvram.plist;sudo rm -rf /tmp/nvram;sudo chflags hidden /nvram.plist" with administrator privileges'`
			fi
	fi	
else
	if [ $(cat /nvram.plist | grep -c 'fmm-mobileme-token') -eq 1 ]
		then
			echo "\"Find My Mac\" Enabled on your system. Do you want to re-Fixed \"Find My Mac\" again? "
			say "Find My Mac Enabled on your system. Do you want to re-Fixed Find My Mac again?"
			DLG=`osascript -e 'display dialog "Your System fixed \"Find My Mac\". Do you want to re-Fix \"Find My Mac\" again?" buttons {"Fix it", "Close"}'`
			if [ $(echo $DLG | grep -c "Fix it") -eq 1 ]
				then 
					X=`osascript -e 'do shell script "sudo rm -rf /nvram.plist;sudo nvram -xp > /tmp/nvram;sudo cp -r /tmp/nvram /nvram.plist;suodo rm -rf /tmp/nvram;sudo chflags hidden /nvram.plist" with administrator privileges'`
					echo "Found old config.";say "Found old config."
					echo "Remove older Config.";say "Remove older Config."
					echo "Setting New Config.";say "Setting New Config."	
			fi
	else
		echo "Your System not fix \"Find My Mac\". Do you want to Fix \"Find My Mac\""
			say "Your System not fix Find My Mac. Do you want to Fix Find My Mac"
			DLG=`osascript -e 'display dialog "Your System not fix \"Find My Mac\". Do you want to Fix \"Find My Mac\"?" buttons {"Fix it", "Close"}'`
			if [ $(echo $DLG | grep -c "Fix it") -eq 1 ]
				then	
					X=`osascript -e 'do shell script "sudo nvram -xp > /tmp/nvram;sudo cp -r /tmp/nvram /nvram.plist;sudo rm -rf /tmp/nvram;sudo chflags hidden /nvram.plist" with administrator privileges'`
					echo "*Setting Config.";say "Setting Config."
			fi
	fi
fi	


if [ $(cat /nvram.plist | grep -c 'fmm-mobileme-token') -eq 1 ]
	then
		echo "Find \"My Mac Fixed\"."
		say "Find My Mac Fixed."
		X=`osascript -e 'display dialog "\"Find My Mac\" Fixed." buttons {"OK"}'`
fi
echo "******************************************************************************************************************************************************"
 		