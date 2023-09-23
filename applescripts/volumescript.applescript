set prevVolume to ""

repeat
	try
		set readVolume to (read POSIX file "/Users/guesthome/Documents/Arduino-Serial-Macro-Pad/applescripts/volume.txt")
	end try
	if readVolume is not prevVolume then
		set volume output volume readVolume
		set prevVolume to readVolume
	end if
	delay (0.1)
end repeat