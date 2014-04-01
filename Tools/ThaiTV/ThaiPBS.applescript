set pl0 to {"ThaiPBS 256kbps", "ThaiPBS 512kbps", "ThaiPBS 1024kbps"}
set v to (choose from list pl0 with prompt "Choose ThaiPBS Resolution: " without empty selection allowed)
if v is not equal to false then
	set v to item 1 of v
end if
set y to false
if v is equal to "ThaiPBS 256kbps" then
	set y to "256"
else if v is equal to "ThaiPBS 512kbps" then
	set y to "512"
else if v is equal to "ThaiPBS 1024kbps" then
	set y to "1024"
end if
if y is not equal to false then
	set x to do shell script "curl -s http://live.thaipbs.or.th | grep 's" & y & "' | grep 'rtmp://' | sed 's/=/ /' | sed 's/\"//' | sed 's/\"//' | sed 's/;//' | awk '{ print $3}'"
	if x is not equal to "" then
		tell application "VLC"
			activate
			OpenURL x
			play
		end tell
	end if
end if