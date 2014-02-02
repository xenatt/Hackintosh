osascript -e 'do shell script "sudo echo \"nvram -xp > /nvram.plist;chflags hidden /nvram.plist;\" >> /etc/rc.shutdown.local;sudo nvram -xp > /tmp/nvram;sudo cp -r /tmp/nvram /nvram.plist;sudo rm -rf /tmp/nvram;sudo chflags hidden /nvram.plist;sudo rm -rf /tmp/com.xenatt.fusion.nvram.plist;sudo cat >> /tmp/com.xenatt.fusion.nvram.plist << EOF
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-/Apple/DTD PLIST 1.0/EN\" \"http:/www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
<key>Label</key>
<string>com.xenatt.fusion.nvram</string>
<key>KeepAlive</key>
<true/>
<key>RunAtLoad</key>
<true/>
<key>ProgramArguments</key>
<array>
<string>/usr/sbin/nvram</string>
<string>-xf</string>
<string>/nvram.plist</string>
</array>
<key>UserName</key>
<string>root</string>
<key>StandardErrorPath</key>
<string>/dev/null</string>
<key>StandardOutPath</key>
<string>/dev/null</string>
</dict>
</plist>
EOF
 
sudo cp -R /tmp/com.xenatt.fusion.nvram.plist /Library/LaunchDaemons/com.xenatt.fusion.nvram.plist;sudo chmod 755 /Library/LaunchDaemons/com.xenatt.fusion.nvram.plist;sudo chown root:wheel /Library/LaunchDaemons/com.xenatt.fusion.nvram.plist;sudo launchctl load /Library/LaunchDaemons/com.xenatt.fusion.nvram.plist" with administrator privileges'