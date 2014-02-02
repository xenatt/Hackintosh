OSX_VER=`sw_vers -productVersion`
echo "-----------------------------------------------------------------------------------------"
echo "RealTek ALC 887 Patch for ${OSX_VER}"
echo "Base by toleda : http://github.com/toleda/audio_ALC887"
echo "-----------------------------------------------------------------------------------------"
echo "Prepare Desktop/audio_ALC887 ..."

DLG=`osascript -e 'display dialog "Do you want to patch AppleHDA for Realtek ALC 887?" buttons {"Yes", "No"}'`
if [ $(echo $DLG | grep -c ":No") == "1" ]
then
echo "No"
exit
fi
if [ ! -d ~/Desktop/ALC887 ]
then
mkdir ~/Desktop/ALC887
fi
if [ -f ~/Desktop/ALC887/887.zip ]
then
rm -f ~/Desktop/ALC887/887.zip
fi

echo "Back Up Original AppleHDA.kext"
cp -R /System/Library/Extensions/AppleHDA.kext ~/Desktop/ALC887/AppleHDA-orig.kext
echo "Which your Realtek ALC 887 Version?"
ALC_VER=`osascript -e 'tell application "Finder" to activate' -e 'choose from list {"100302", "100202"} with prompt "Realtek ALC 887 Version" without empty selection allowed'`
if [ $ALC_VER == "100302" ]
then
echo "Download Realtek ALC 887 Version 100302 files"
curl -s -o ~/Desktop/ALC887/887.zip https://raw.github.com/toleda/audio_ALC887/master/887.zip
elif [ $ALC_VER == "100202" ]
then
echo "Download Realtek ALC 887 Version 100302 files"
curl -s -o ~/Desktop/ALC887/887.zip https://raw.github.com/toleda/audio_ALC887/master/887_v100202.zip
fi
if [ -f ~/Desktop/ALC887/887.zip ]
then
unzip ~/Desktop/ALC887/887.zip -d ~/Desktop/ALC887/
cd ~/Desktop/ALC887/887
else
echo "Error : Download file error"
exit
fi
if [ -d ~/Desktop/ALC887/887 ]
then
if [[ "$OSX_VER" == "10.8" || "$OSX_VER" == "10.8.0" || "$OSX_VER" == "10.8.1" "$OSX_VER" == "10.8.2" || "$OSX_VER" == "10.8.3" || "$OSX_VER" == "10.8.4" ]]
then
echo "Patching AppleHDA.kext for Mac OS X 10.8.4"
echo "Install Patch files ..."
cd ~/Desktop/ALC887/887
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo install -m 644 -o root -g wheel Info-84.plist /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Resources/*.zlib
sudo install -m 644 -o root -g wheel Platforms.xml.zlib layout1.xml.zlib layout2.xml.zlib layout3.xml.zlib /System/Library/Extensions/AppleHDA.kext/Contents/Resources
echo "Patch binary ..."
sudo perl -pi -e 's|\xff\x87\xec\x1a\x0f\x8f\x53\x01\x00\x00|\x87\x08\xec\x10\x0f\x84\x2a\x01\x00\x00|g' /System/Library/Extensions/AppleHDA.kext/Contents/MacOS/AppleHDA
sudo perl -pi -e 's|\xff\x87\xec\x1a\x0f\x8f\x2f\x01\x00\x00|\x87\x08\xec\x10\x0f\x84\x06\x01\x00\x00|g' /System/Library/Extensions/AppleHDA.kext/Contents/MacOS/AppleHDA

elif [ "$OSX_VER" == "10.8.5" ]
then
echo "Patching AppleHDA.kext for Mac OS X 10.8.5"
echo "Install Patch files ..."
cd ~/Desktop/ALC887/887
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo install -m 644 -o root -g wheel Info-85.plist /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Resources/*.zlib
sudo install -m 644 -o root -g wheel Platforms.xml.zlib layout1.xml.zlib layout2.xml.zlib layout3.xml.zlib /System/Library/Extensions/AppleHDA.kext/Contents/Resources
echo "Patch binary ..."
sudo perl -pi -e 's|\x8b\x19\xd4\x11|\x87\x08\xec\x10|g' /System/Library/Extensions/AppleHDA.kext/Contents/MacOS/AppleHDA

elif [[ "$OSX_VER" == "10.9" || "$OSX_VER" == "10.9.0" ]]
then
echo "Patching AppleHDA.kext for Mac OS X 10.9"
echo "Install files ..."
cd ~/Desktop/ALC887/887
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo install -m 644 -o root -g wheel Info-90.plist /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Resources/*.zlib
sudo install -m 644 -o root -g wheel Platforms.xml.zlib layout1.xml.zlib layout2.xml.zlib layout3.xml.zlib /System/Library/Extensions/AppleHDA.kext/Contents/Resources
echo "Patch binary ..."
sudo perl -pi -e 's|\x8b\x19\xd4\x11|\x87\x08\xec\x10|g' /System/Library/Extensions/AppleHDA.kext/Contents/MacOS/AppleHDA

elif [ "$OSX_VER" == "10.9.1" ]
then
echo "Patching AppleHDA.kext for Mac OS X 10.9"
echo "Install files ..."
cd ~/Desktop/ALC887/887
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo install -m 644 -o root -g wheel Info-91.plist /System/Library/Extensions/AppleHDA.kext/Contents/Plugins/AppleHDAHardwareConfigDriver.kext/Contents/Info.plist
sudo rm -R /System/Library/Extensions/AppleHDA.kext/Contents/Resources/*.zlib
sudo install -m 644 -o root -g wheel Platforms.xml.zlib layout1.xml.zlib layout2.xml.zlib layout3.xml.zlib /System/Library/Extensions/AppleHDA.kext/Contents/Resources
echo "Patch binary ..."
sudo perl -pi -e 's|\x8b\x19\xd4\x11|\x87\x08\xec\x10|g' /System/Library/Extensions/AppleHDA.kext/Contents/MacOS/AppleHDA
fi

echo "Fix permissions ..."
sudo chown -R root:wheel /System/Library/Extensions/AppleHDA.kext

HDAE_VER=`osascript -e 'tell application "Finder" to activate' -e 'choose from list {"DSDT Inject","HDAEnable 1", "HDAEnable 2", "HDAEnable 12"} with prompt "HDAEnable Version" without empty selection allowed'`
if [ "$HDAE_VER" == "DSDT Inject" ]
then
echo "DSDT Inject"
elif [ "$HDAE_VER" == "HDAEnable 1" ]
then
echo "Download HDAEnable 1"
curl -s -o ~/Desktop/ALC887/HDAEnabler1.kext.zip https://raw.github.com/toleda/audio_kext_enabler/master/HDAEnabler1.kext.zip
unzip ~/Desktop/ALC887/HDAEnabler1.kext.zip -d ~/Desktop/ALC887/
echo "Install HDAEnable.."
sudo cp -r ~/Desktop/ALC887/HDAEnabler1.kext /System/Library/Extensions/HDAEnabler1.kext
rm -rf ~/Desktop/ALC887/HDAEnabler1.kext
sudo chown -R root:wheel /System/Library/Extensions/HDAEnabler1.kext
elif [ "$HDAE_VER" == "HDAEnable 2" ]
then
echo "Download HDAEnable 2"
curl -s -o ~/Desktop/ALC887/HDAEnabler2.kext.zip https://raw.github.com/toleda/audio_kext_enabler/master/HDAEnabler2.kext.zip
unzip ~/Desktop/ALC887/HDAEnabler2.kext.zip -d ~/Desktop/ALC887/
echo "Install HDAEnable.."
sudo cp -r ~/Desktop/ALC887/HDAEnabler2.kext /System/Library/Extensions/HDAEnabler2.kext
rm -rf ~/Desktop/ALC887/HDAEnabler2.kext
sudo chown -R root:wheel /System/Library/Extensions/HDAEnabler2.kext
elif [ "$HDAE_VER" == "HDAEnable 12" ]
then
echo "Download HDAEnable 12"
curl -s -o ~/Desktop/ALC887/HDAEnabler12.kext.zip https://raw.github.com/toleda/audio_kext_enabler/master/HDAEnabler12.kext.zip
unzip ~/Desktop/ALC887/HDAEnabler12.kext.zip -d ~/Desktop/ALC887/
echo "Install HDAEnable.."
sudo cp -r ~/Desktop/ALC887/HDAEnabler12.kext /System/Library/Extensions/HDAEnabler12.kext
rm -rf ~/Desktop/ALC887/HDAEnabler12.kext
sudo chown -R root:wheel /System/Library/Extensions/HDAEnabler12.kext
fi
echo "Clear Kernel Cache..."
sudo rm -fr /System/Library/Caches/*
sudo touch /System/Library/Extensions
echo "Clean Temporary file.."
rm -R ~/Desktop/ALC887/887
cp -R /System/Library/Extensions/AppleHDA.kext ~/Desktop/ALC887/AppleHDA.kext
echo "Finished, restart required."