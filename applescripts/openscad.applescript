set keyCodeListPos to {0, 0, 83, 84, 85, 86, 87, 88, 89, 91, 92, 82, 81, 65}
set keyCodeListNeg to {65, 81, 82, 92, 91, 89, 88, 87, 86, 85, 84, 83, 0, 0}
set prevButton to (read POSIX file "/Users/guesthome/Documents/Arduino-Serial-Macro-Pad/applescripts/button.txt")
set keyCode to ""
set readButton to (read POSIX file "/Users/guesthome/Documents/Arduino-Serial-Macro-Pad/applescripts/button.txt")

repeat
	try
		set readButton to (read POSIX file "/Users/guesthome/Documents/Arduino-Serial-Macro-Pad/applescripts/button.txt")
	end try
	if readButton is not prevButton then
		set prevButton to readButton
		if readButton is in {"2", "-2"} then
			tell application "System Events"
				set frontmostProcess to first process where it is frontmost
				set appName to name of frontmostProcess
			end tell
			if "Discord" is in appName then
				tell application "System Events" to keystroke "m" using {command down, shift down}
			else
				tell application "Discord" to activate
				tell application "System Events"
					keystroke "m" using {command down, shift down}
					--keystroke "d" using {command down, shift down}
					keystroke tab using {command down}
				end tell
			end if
		else if readButton is in {"1", "-1"} then
		else if readButton is in {"3", "-3"} then
			tell application "System Events" to key code 96
		else if readButton is in {"4", "-4"} then
			tell application "System Events" to key code 97
		else if readButton is in {"5", "-5"} then
			tell application "System Events" to keystroke "s" using command down
		else if readButton is in {"6", "-6"} then
			tell application "System Events" to key code 98
		else if readButton is in {"7", "-7"} then
			tell application "System Events" to keystroke "7" using command down
		else if readButton is in {"8", "-8"} then
			tell application "System Events" to keystroke "6" using command down
		else if readButton is in {"9", "-9"} then
			tell application "System Events" to keystroke "4" using command down
		else if readButton is in {"10", "-10"} then
			tell application "System Events" to keystroke "2" using command down
		else if readButton is in {"11", "-11"} then
			tell application "System Events" to keystroke "9" using command down
		else if readButton is in {"12", "-12"} then
			tell application "System Events" to keystroke "8" using command down
		else if readButton is in {"13", "-13"} then
			tell application "System Events" to keystroke "5" using command down
		else if readButton is in {"14", "-14"} then
			tell application "System Events" to keystroke "1" using command down
		end if
	end if
	delay (0.1)
end repeat