set pl0 to {"ThaiPBS 420p", "ThaiPBS 720p", "ThaiPBS 1080p"}
set v to (choose from list pl0 with prompt "Choose ThaiPBS Resolution: " without empty selection allowed)
if v is not equal to false then
	set v to item 1 of v
end if
if v is equal to "ThaiPBS 420p" then
	tell application "VLC"
		activate
		OpenURL "rtmp://203.189.117.24/cdnlive/tpbspc0?TH=2853227=abb21929ec839c2843b1522c1ad94cb0"
		play
	end tell
else if v is equal to "ThaiPBS 720p" then
	tell application "VLC"
		activate
		OpenURL "rtmp://184.171.162.14/cdnlive/tpbspc1?INT=8958381=abb21929ec839c2843b1522c1ad94cb0"
		play
	end tell
else if v is equal to "ThaiPBS 1080p" then
	tell application "VLC"
		activate
		OpenURL "rtmp://184.171.162.14/cdnlive/tpbspc2?INT=8958381=abb21929ec839c2843b1522c1ad94cb0"
		play
	end tell
end if