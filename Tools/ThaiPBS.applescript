set pl0 to {"ThaiPBS 420p", "ThaiPBS 720p", "ThaiPBS 1080p"}
set v to (choose from list pl0 with prompt "Choose ThaiPBS Resolution: " without empty selection allowed)
set v to item 1 of v
if v is equal to "ThaiPBS 420p" then
	tell application "VLC"
		activate
		OpenURL "rtmp://edge.geolb.101g.net/cdnlive/tpbspc0"
		play
	end tell
else if v is equal to "ThaiPBS 720p" then
	tell application "VLC"
		activate
		OpenURL "rtmp://edge.geolb.101g.net/cdnlive/tpbspc1"
		play
	end tell
else if v is equal to "ThaiPBS 1080p" then
	tell application "VLC"
		activate
		OpenURL "rtmp://edge.geolb.101g.net/cdnlive/tpbspc1"
		play
	end tell
end if