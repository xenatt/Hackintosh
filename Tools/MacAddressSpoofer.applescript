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
set l1 to {}
repeat 10 times
	set x to do shell script "perl -e 'printf \"%02X:%02X:%02X:%02X:%02X:%02X
\", rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF, rand 0xFF'"
	set beginning of l1 to x
end repeat
set x to (choose from list l1 with prompt "Choose New Mac Adress: " without empty selection allowed)
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
