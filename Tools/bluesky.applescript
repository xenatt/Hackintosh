set u to "http://www.wezatv.com/tool/free/bluesky.php"
set x to "curl -s " & u & " | grep 'file: \"http:' | awk '{print $2}' | sed 's/\"//' | sed 's/\"//' | sed 's/,//'"
set y to do shell script x
y
if y is not equal to "" then
	tell application "VLC"
		activate
		OpenURL y
		play
	end tell
end if