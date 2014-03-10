set home to (do shell script "echo ~")
set confp to home & "/Library/Application Support/org.xenatt.script/macspoof.conf"
set confx to POSIX file confp
try
	set conff to do shell script "cat  '" & confp & "'"
on error
	set conff to ""
end try
try
	if not (exists file home & "/Library/Application Support/org.xenatt.script/'") then
		do shell script "mkdir '" & home & "/Library/Application Support/org.xenatt.script/'"
	end if
end try
on backup(device)
	set home to (do shell script "echo ~")
	set confp to home & "/Library/Application Support/org.xenatt.script/macspoof.conf"
	set tmpx to ""
	try
		set tmp to do shell script "ifconfig " & device & " | grep -c ether"
		set atmp to do shell script "ifconfig " & device & "| grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'"
	on error
		set tmp to "0"
	end try
	
	if tmp is equal to "1" then
		set tmpx to device & " ether " & atmp
	end if
	try
		set tmp to do shell script "ifconfig " & device & " | grep -c Wi-Fi"
	on error
		set tmp to "0"
	end try
	if tmp is equal to "1" then
		set tmpx to device & " Wi-Fi " & " " & atmp
	end if
	if tmpx is not equal to "" then
		return tmpx
	else
		return false
	end if
end backup
on genup()
	set home to (do shell script "echo ~")
	set confp to home & "/Library/Application Support/org.xenatt.script/macspoof.conf"
	set confx to POSIX file confp
	try
		if exists file confx then
			do shell script "rm -rf '" & confp & "'"
		end if
	end try
	set i to 0
	repeat 5 times
		try
			set nif to do shell script "ifconfig en" & i
			set nif to "yes"
		on error
			set nif to "no"
		end try
		set device to "en" & i
		set tmpy to backup(device)
		if tmpy is not equal to false then
			do shell script "echo " & tmpy & " >> '" & confp & "'"
		end if
		try
			set nif to do shell script "ifconfig wlan" & i
			set nif to "yes"
		on error
			set nif to "no"
		end try
		set device to "wlan" & i
		set tmpy to backup(device)
		if tmpy is not equal to false then
			do shell script "echo " & tmpy & " >> '" & confp & ""
		end if
		set i to i + 1
	end repeat
end genup
set l0 to {}
on device_check(device)
	set tmpx to ""
	try
		set tmp to do shell script "ifconfig " & device & " | grep -c ether"
		set atmp to do shell script "ifconfig " & device & "| grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'"
	on error
		set tmp to "0"
	end try
	
	if tmp is equal to "1" then
		set tmpx to device & " : Ethernet"
	end if
	try
		set tmp to do shell script "ifconfig " & device & " | grep -c Wi-Fi"
	on error
		set tmp to "0"
	end try
	if tmp is equal to "1" then
		set tmpx to device & " : Wi-Fi" & " " & atmp
	end if
	return tmpx
end device_check
if conff is equal to "" then
	set l3 to {"Back Up Mac Address", "Change Mac Address"}
	set v to (choose from list l3 with prompt "Choose Action" without empty selection allowed)
else
	set l3 to {"Restore Mac Address", "Change Mac Address"}
	set v to (choose from list l3 with prompt "Choose Action" without empty selection allowed)
end if
set x to false
if v is not equal to false then
	set v to item 1 of v
	if v is equal to "Change Mac Address" then
		set l1 to {}
		repeat 10 times
			set x to do shell script "perl -e 'printf \"%02X:%02X:%02X:%02X:%02X:%02X\", rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF'"
			set beginning of l1 to x
		end repeat
		set x to (choose from list l1 with prompt "Choose New Mac Adress: " without empty selection allowed)
		
	else if v is equal to "Back Up Mac Address" then
		genup()
		set conff to do shell script "cat  '" & confp & "'"
		if conff is not equal to "" then
			display dialog "Back Up Complete" with title "Mac Adress Spoofer : Backup" buttons {"Close"} default button "Close"
		end if
	else if v is equal to "Restore Mac Address" then
		set conff to do shell script "cat  '" & confp & "'"
		set t to paragraphs of conff
		set tc to count of t
		set i to 1
		repeat tc times
			set ti to item i of t
			if ti is not equal to "" then
				do shell script "sudo ifconfig " & ti with administrator privileges
			end if
			set i to i + 1
		end repeat
		display dialog "Success,Restore Complete" with title "Mac Adress Spoofer : Restore" buttons {"Close"} default button "Close"
	end if
end if
if x is not false then
	display dialog "Do you need to Change Mac Address?" with title "Mac Adress Spoofer" default answer x buttons {"Close", "Change"} default button "Change"
	if button returned of result = "Change" then
		set madd to text returned of result
		set i to 0
		repeat 5 times
			try
				set nif to do shell script "ifconfig en" & i
				set nif to "yes"
			on error
				set nif to "no"
			end try
			set device to "en" & i
			set tmpy to device_check(device)
			if tmpy is not equal to "" then
				set end of l0 to tmpy
			end if
			try
				set nif to do shell script "ifconfig wlan" & i
				set nif to "yes"
			on error
				set nif to "no"
			end try
			set device to "wlan" & i
			set tmpy to device_check(device)
			if tmpy is not equal to "" then
				set end of l0 to tmpy
			end if
			set i to i + 1
		end repeat
		set dev to (choose from list l0 with prompt "Choose Network Interface Device : " without empty selection allowed)
		if dev is not false then
			set devi to do shell script "echo " & dev & " | awk '{print $1}'"
			set deva to do shell script "echo " & dev & " | awk '{print $3}'"
			if deva is equal to "Ethernet" then
				set deva to "ether"
			end if
			do shell script "sudo ifconfig " & devi & " " & deva & " " & madd with administrator privileges
			set y to do shell script "ifconfig " & devi & "| grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'"
			set deva to do shell script "echo " & dev & " | awk '{print $3}'"
			if y is equal to madd then
				display dialog "Success, Spoofing " & deva & " Mac Address to " & y buttons {"Close"} default button "Close"
			else
				display dialog "Error, Spoof " & deva & " Mac Address to " & madd & ". 
	  Current Mac Adress is " & y & "." buttons {"Close"} default button "Close"
			end if
		end if
	end if
end if
