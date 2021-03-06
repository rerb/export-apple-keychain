-- based on script at https://discussions.agilebits.com/discussion/comment/455708/#Comment_455708

-- todo: escape delimiter in output
-- todo: mask input in password dialog
-- todo: set howManyTimes to number of items in Keychain Access at and below current selection
-- todo: choose output format, org or csv
-- todo: insert appropriate header for format
-- todo: create new file in textedit
-- todo: make textedit file plain text (https://knowledge.autodesk.com/search-result/caas/sfdcarticles/sfdcarticles/How-to-create-a-plain-text-file-using-TextEdit-on-a-Mac.html)
-- todo: automate export of script on save, to (presumably) local git repo

set keychainPassword to the text returned of (display dialog "Keychain password?" default answer "")

set howManyTimes to the text returned of (display dialog "Repeat how many times?" default answer 50)

repeat howManyTimes times
	delay 0.2
	tell application "Keychain Access"
		activate
		
		tell application "System Events"
			delay 0.2
			keystroke return
			
			-- Press ⌘C to copy item title
			delay 0.2
			keystroke "c" using command down
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ⌘V
			delay 0.2
			keystroke "|"
			keystroke "v" using command down
			
			-- Type a delimiter
			delay 0.2
			keystroke "|"
			
		end tell
	end tell
	
	--Switch to Keychain
	tell application "Keychain Access"
		activate
		tell application "System Events"
			-- Press Tab x3 to get to item url 
			delay 0.1
			keystroke tab
			delay 0.1
			keystroke tab
			delay 0.1
			keystroke tab
			
			-- Press ⌘C
			delay 0.2
			keystroke "c" using command down
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ⌘V
			delay 0.2
			keystroke "v" using command down
			
			-- Type ','
			delay 0.2
			keystroke "|"
		end tell
	end tell
	
	--Switch to Keychain
	tell application "Keychain Access"
		activate
		tell application "System Events"
			-- Press Shift-Tab to get to item account name
			delay 0.1
			keystroke tab using shift down
			
			-- Press ⌘C
			delay 0.2
			keystroke "c" using command down
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ⌘V
			delay 0.2
			keystroke "v" using command down
			
			-- Type ','
			delay 0.2
			keystroke "|"
		end tell
	end tell
	
	--Switch to Keychain
	tell application "Keychain Access"
		activate
		tell application "System Events"
			-- Click the “Show password:” checkbox.
			delay 0.2
			keystroke "c" using {shift down, command down}
			
			-- Type password - update to yours
			delay 0.5
			keystroke keychainPassword
			delay 0.2
			keystroke return
			
			-- Close keychain item window
			delay 0.3
			keystroke "w" using command down
			
			-- Go to next keychain item
			delay 0.2
			key code 125
		end tell
	end tell
	
	--Switch to TextEdit
	delay 0.2
	tell application "TextEdit"
		activate
		tell application "System Events"
			-- Press ⌘V
			delay 0.2
			keystroke "v" using command down
			
			-- Press ',' to end the item
			delay 0.2
			keystroke "|"
			
			-- Press Return to start new item line
			delay 0.1
			keystroke return
		end tell
	end tell
	
	
end repeat
end run