##NVRAM   
Tools And Document for Fix NVRAM (iCloud,iMessage,Find My Mac)    
     
**iMessage Fix**.[Download](https://raw.github.com/xenatt/Hackintosh/master/NVRAM/iMessageFix.dmg),[Read](https://raw.github.com/xenatt/Hackintosh/master/NVRAM/iMessageFix.applescript)       
Fix iCloud, iMessage,  App Store login prblem.  
Best for Chameleon and Chimera.  After run this app remove all network interface from System preferences.
edit /Extra/org.chameleon.boot.plist add section    

<key>EthernetBuiltIn</key>   
<string>Yes</string>    
login iCloud first , App store , iMessage.                 
     
![iMessage Fix](https://raw.github.com/xenatt/Hackintosh/master/NVRAM/iMessageFix.png)      
![iMessage Fix Network](https://raw.github.com/xenatt/Hackintosh/master/NVRAM/iMessageFixNetwork.png)     
 

**NVRAM Loader For Funsion.** [Download](https://raw.github.com/xenatt/Hackintosh/master/NVRAM/FusionLoadNvram.command), [Read](https://github.com/xenatt/Hackintosh/blob/master/NVRAM/FusionLoadNvram.command)    
Clover on Fusion Drive have Bugs With NVRAM Emulator.   

**Fix Find My Mac.**[Download](https://raw.github.com/xenatt/Hackintosh/master/NVRAM/Fix-Find-My-Mac.command), [Read](https://github.com/xenatt/Hackintosh/blob/master/NVRAM/Fix-Find-My-Mac.command)  
Find My Fix for Clover Not for Fusion Drive.    
Make Sure your Audio Device Work Before use this.     

if your audio won't work use Fix-Find-My-Mac-No-Say.command. [Download](https://raw.github.com/xenatt/Hackintosh/master/NVRAM/Fix-Find-My-Mac-No-Say.command), [Read](https://github.com/xenatt/Hackintosh/blob/master/NVRAM/Fix-Find-My-Mac-No-Say.command)   
