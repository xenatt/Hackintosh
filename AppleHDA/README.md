##AppleHDA Patch Tools For Realtek ALC

OS X Realtek ALC887 Onboard Audio

This guide enables OS X Realtek ALC onboard audio on Intel based motherboards 
with a bootable clean install of OS X. The Realtek AppleHDA.kext only works with 
the codec the kext was edited for and patches the native AppleHDA.kext.


This Script Auto detect Mac OS X Version and Graphic User Interfce.
Auto Download Patch and HDAEnable from toleda GitHub : https://github.com/toleda/
____________________________________________________________

[Realtek ALC887](/ALC887Patch.command/) 
ALC887_v100302 Current - Sandy Bridge/6 Series motherboards and newer
ALC887_v100202 Legacy - 5 Series motherboards and older

Requirements
Supported OS X versions.
10.8-10.9.1


Realtek ALC AppleHDA Guides https://github.com/toleda/audio_ALCInjection
1. M-Realtek ALC AppleHDA Capabilities.pdf
2. M-Realtek ALC AppleHDA Customization.pdf
3. M-Realtek ALC AppleHDA No Audio.pdf
4. M-Realtek ALC AppleHDA Screenshots.pdf


Three Realtek ALC887 AppleHDA.kext Audio_IDs, select one
1. Audio_ID: 1 supports 5 and 6 port ALC8xx onboard and/or AMD/Nvidia HDMI audio  
2, Audio_ID: 2 supports 3 port ALC8xx onboard and/or AMD/Nvidia HDMI audio
3. Audio_ID: 3 supports 3, 5 and 6 port ALC8xx onboard HD4K/HD3K HDMI audio
	with or without AMD/Nvidia HDMI audio
4. Audio_IDs: 1 and 2 support analog 5.1 surround sound, 3 does not
5. Audio_IDs: 1, 2 and 3 require HDMI audio dsdt edits for HDMI audio 

Four techniques enable the Realtek ALC AppleHDA.kext, select one
1. HDEF/kext/No dsdt/audio enabler = Audio_ID, see [Guide] Add HDEF-kext.pdf https://github.com/toleda/audio_kext_enabler
1a. Audio_ID = 1/HDAEnabler 1  
1b. Audio_ID = 2/HDAEnabler 2 
1c. Audio_ID = 3/HDAEnabler 12
2. HDEF/dsdt/layout-id = Audio_ID, see [Guide] Add or Edit HDEF-dsdt.pdf https://github.com/toleda/audio_ALCInjection
2a. Audio_ID = 1/layout-id: 0x01, 0x00, 0x00, 0x00, 0x00
2b. Audio_ID = 2/layout-id: 0x02, 0x00, 0x00, 0x00, 0x00
2c. Audio_ID = 3, see dsdt/HD3K/HD4K HDMI audio
3. HDEF/lssdt/ayout-id = Audio_ID, see [Guide] Add HDEF-ssdt.pdf https://github.com/toleda/audio_ssdt_enabler
3a. Audio_ID = 1/audio_ssdt-hdae-1.zip
3b. Audio_ID = 2/audio_ssdt-hdae-2.zip
3c. Audio_ID = 3, see ssdt/HD3K/HD4K HDMI audio
4. HDEF/Clover/Config.plist/Devices, see [Guide] Add HDEF-Clover.pdf https://github.com/toleda/audio_ALCInjection
4a. Audio_ID = 1/Audio/Inject=1
4b. Audio_ID = 2/Audio/Inject=2
4c. Audio_ID = 3/Audio/Inject=3

Download
1. https://github.com/xenatt/audio_ALC887
2. Select: ALC887_Patch.command open Raw
3. Save as ALC887_Patch.command


Installation/Shell Script/.command
1. Downloads ALC[887/892/898/1150]Patch.command/
2. Launch (double click: ALC[887/892/898/1150]Patch.command)
3. Chooice Realtek ALC Version
4. Enter Password at prompt
5. Save Log: Terminal/Shell/Export Text As../Terminal Saved Output/Desktop/ALC[887/892/898/1150]
6. Chooice HDAEnable
7. Restart

