on clickElement(thisURL)
	set totalPop to 100
	tell application "Google Chrome"
		activate
		if ((count of windows) = 0) then
			make new window with properties {bounds:{0, 0, 960, 622}}
		else
			set bounds of window 1 to {0, 0, 960, 622}
		end if
		open location thisURL
		repeat until (loading of active tab of front window is false)
			delay 0.1
		end repeat
		tell active tab of front window
			set catPop to 0
			repeat until (catPop = totalPop)
				tell application "System Events" to keystroke "f"
				set catPop to catPop + 1
				delay 0.1
			end repeat
		end tell
	end tell
end clickElement
clickElement("https://popcat.click")