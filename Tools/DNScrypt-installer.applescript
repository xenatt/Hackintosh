set brew to "/usr/local/bin/brew"
set dnscrypt to "/usr/local/opt/dnscrypt-proxy/sbin/dnscrypt-proxy"
tell application "Finder"
	try
		if not (exists dnscrypt as POSIX file) then
			if not (exists brew as POSIX file) then
				set x to display dialog "Do you want to install brew?" with title "DNSCrypt Proxy Installer : brew" buttons {"Close", "Install"} default button "Install"
				set x to button returned of x
				if x is equal to "Install" then
					tell application "Terminal"
						do script "ruby -e \"$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)\";brew install dnscrypt-proxy;"
						set y to display dialog "Click \"Confirm\" After install Dnscrypt Proxy in Terminal completed " buttons {"Close", "Confirm"} default button "Confirm"
						set y to button returned of y
					end tell
				end if
			else
				tell application "Terminal"
					do script "brew install dnscrypt-proxy;"
				end tell
				set y to display dialog "Click \"Confirm\" After install Dnscrypt Proxy in Terminal completed " buttons {"Close", "Confirm"} default button "Confirm"
				set y to button returned of y
			end if
		end if
	end try
end tell
tell application "Finder"
	try
		if exists dnscrypt as POSIX file then
			set nlist to {"OpenDNS", "CloudNS (no logs, DNSSEC) Canberra, Australia", "CloudNS (no logs, DNSSEC) Sydney, Australia", "OpenNIC (no logs) Japan", "OpenNIC (no logs) UK NovaKing (ns8)", "OpenNIC (no logs) UK NovaKing (ns9)", "OpenNIC (no logs) UK NovaKing (ns10)", "OpenNIC (no logs) US (ns17)", "DNSCrypt.eu (no logs, DNSSEC) Holland", "DNSCrypt.eu (no logs, DNSSEC) Denmark", "Soltysiak.com (no logs, DNSSEC) Poznan, Poland"}
			set xname to false
			set xname to (choose from list nlist with prompt "Choose DNSCrypt Server: " without empty selection allowed)
			if xname is not false then
				set xname to item 1 of xname
			end if
			
			if xname is equal to "OpenDNS" then
				set xip to "208.67.220.220:443"
				set xhost to "2.dnscrypt-cert.opendns.com"
				set xkey to "B735:1140:206F:225D:3E2B:D822:D7FD:691E:A1C3:3CC8:D666:8D0C:BE04:BFAB:CA43:FB79"
			else if xname is equal to "CloudNS (no logs, DNSSEC) Canberra, Australia" then
				set xip to "113.20.6.2:443"
				set xhost to "2.dnscrypt-cert.cloudns.com.au"
				set xkey to "1971:7C1A:C550:6C09:F09B:ACB1:1AF7:C349:6425:2676:247F:B738:1C5A:243A:C1CC:89F4"
			else if xname is equal to "CloudNS (no logs, DNSSEC) Sydney, Australia" then
				set xip to "113.20.8.17:443"
				set xhost to "2.dnscrypt-cert-2.cloudns.com.au"
				set xkey to "67A4:323E:581F:79B9:BC54:825F:54FE:1025:8B4F:37EB:0D07:0BCE:4010:6195:D94F:E330"
			else if xname is equal to "OpenNIC (no logs) Japan" then
				set xhost to "106.186.17.181:2053 "
				set xip to "2.dnscrypt-cert.ns2.jp.dns.opennic.glue"
				set xkey to "8768:C3DB:F70A:FBC6:3B64:8630:8167:2FD4:EE6F:E175:ECFD:46C9:22FC:7674:A1AC:2E2A"
			else if xname is equal to "OpenNIC (no logs) UK NovaKing (ns8)" then
				set xip to "185.19.104.45:443"
				set xhost to "2.dnscrypt-cert.ns8.uk.dns.opennic.glue"
				set xkey to "A17C:06FC:BA21:F2AC:F4CD:9374:016A:684F:4F56:564A:EB30:A422:3D9D:1580:A461:B6A6"
			else if xname is equal to "OpenNIC (no logs) UK NovaKing (ns9)" then
				set xip to "85.19.105.6:443"
				set xhost to "2.dnscrypt-cert.ns9.uk.dns.opennic.glue"
				set xkey to "E864:80D9:DFBD:9DB4:58EA:8063:292F:EC41:9126:8394:BC44:FAB8:4B6E:B104:8C3B:E0B4"
			else if xname is equal to "OpenNIC (no logs) UK NovaKing (ns10)" then
				set xip to "185.19.105.14:443"
				set xhost to "2.dnscrypt-cert.ns10.uk.dns.opennic.glue"
				set xkey to "B1AB:7025:1119:9AEE:E42E:1B12:F2EF:12D4:53D9:CD92:E07B:9AF4:4794:F6EB:E5A4:F725"
			else if xname is equal to "OpenNIC (no logs) US (ns17)" then
				set xip to "173.230.156.28:443"
				set xhost to "2.dnscrypt-cert.ns17.ca.us.dns.opennic.glue"
				set xkey to "2342:215C:409A:85A5:FB63:2A3B:42CD:5089:6BA8:551A:8BDC:2654:CF57:804F:B1B2:5019"
			else if xname is equal to "DNSCrypt.eu (no logs, DNSSEC) Holland" then
				set xip to "176.56.237.171:443"
				set xhost to "2.dnscrypt-cert.resolver1.dnscrypt.eu"
				set xkey to "67C0:0F2C:21C5:5481:45DD:7CB4:6A27:1AF2:EB96:9931:40A3:09B6:2B8D:1653:1185:9C66"
			else if xname is equal to "DNSCrypt.eu (no logs, DNSSEC) Denmark" then
				set xip to "77.66.84.233:443"
				set xhost to "2.dnscrypt-cert.resolver2.dnscrypt.eu"
				set xkey to "3748:5585:E3B9:D088:FD25:AD36:B037:01F5:520C:D648:9E9A:DD52:1457:4955:9F0A:9955"
			else if xname is equal to "Soltysiak.com (no logs, DNSSEC) Poznan, Poland" then
				set xip to "178.216.201.222:2053"
				set xhost to "2.dnscrypt-cert.soltysiak.com"
				set xkey to "25C4:E188:2915:4697:8F9C:2BBD:B6A7:AFA4:01ED:A051:0508:5D53:03E7:1928:C066:8F21"
			end if
			set io to "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-/Apple/DTD PLIST 1.0/EN\" \"http:/www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
  <dict>
    <key>Label</key>
    <string>homebrew.mxcl.dnscrypt-proxy</string>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
    <key>ProgramArguments</key>
    <array>
      <string>/usr/local/opt/dnscrypt-proxy/sbin/dnscrypt-proxy</string>
      <string>--local-address=127.0.0.1:53</string>
      <string>--user=nobody</string>
      <string>--resolver-address=" & xip & "</string>
      <string>--provider-xname=" & xhost & "</string>
      <string>--provider-key=" & xkey & "</string>
    </array>
    <key>Userxname</key>
    <string>root</string>
    <key>StandardErrorPath</key>
    <string>/dev/null</string>
    <key>StandardOutPath</key>
    <string>/dev/null</string>
  </dict>
</plist>"
			tell application "Terminal"
				do shell script "cat > /tmp/homebrew.mxcl.dnscrypt-proxy.plist << EOF
" & io & "
EOF"
			end tell
			
			if xip is not "" and xhost is not "" and xname is not "" and xkey is not "" then
				tell application "Terminal"
					set y to do shell script "sudo mv /tmp/homebrew.mxcl.dnscrypt-proxy.plist /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist;sudo chmod 755 /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist;sudo chown root:wheel /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist;sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnscrypt-proxy.plist;echo \"Success, Configure DNScrypt proxy complete\";" with administrator privileges
				end tell
				display dialog "Dnscrypt Proxy Install Completed" buttons {"Close"} default button "Close"
				
			else
				display dialog "Error, Dnscrypt Proxy Not install please try again" buttons {"Close"} default button "Close"
			end if
		else
			display dialog "Dnscrypt Proxy Not install please try again" buttons {"Close"} default button "Close"
		end if
	end try
end tell
