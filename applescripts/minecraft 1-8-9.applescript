set keyCodeListPos to {82, 0, 83, 84, 85, 86, 87, 88, 89, 91, 92, 69, 78, 81}
set keyCodeListNeg to {81, 78, 69, 92, 91, 89, 88, 87, 86, 85, 84, 83, 0, 82}
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
		else
			if readButton > 0 then
				set keyCode to item readButton of keyCodeListPos
			else
				set keyCode to item readButton of keyCodeListNeg
			end if
			tell application "System Events" to key code keyCode
		end if
	end if
	delay (0.1)
end repeat