display dialog "Do you want to refresh LaunchPad and Context menu icons?" with title "Refress Launchpad icons" buttons {"Close", "Refresh"} default button "Refresh"
if button returned of result = "Refresh" then
	do shell script "rm -rf ~/Library/Application Support/Dock/*.db;killall Dock"
	display dialog "Success, Refreshed LaunchPad and Context menu icons" with title "Refress Launchpad icons" buttons {"Close"} default button "Close"
end if