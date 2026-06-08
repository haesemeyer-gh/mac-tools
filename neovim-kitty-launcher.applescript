(* Neovim Kitty Launcher
 * CC BY-SA 4.0
 * © 2026 haesemeyer <haesemeyer@mailbox.org>
 * codeberg.org/haesemeyer/mac-tools
 *)

-- function to open a new kitty window and run a command
on run_kitty(cmd)

		-- open new kitty window if kitty is already running
		if application "kitty" is running then
			tell application "System Events" to tell process "kitty"
				click menu item "New OS Window" of menu 1 of menu bar item "Shell" of menu bar 1
			end tell
		end if

		-- focus kitty (and start if not already running)
		tell application "kitty" to activate

		-- enter command as keystrokes
		tell application "System Events"
			keystroke cmd
			key code 36
		end tell

end run_kitty

-- file handler
on open theFiles
	repeat with f in theFiles

		-- command definition
		set cmd to "nvim"
		if f is not {} then
			set filePath to POSIX path of f
			set cmd to "nvim \"" & filePath & "\""
		end if

		run_kitty(cmd)

	end repeat
end open

-- handler for running without opening files
on run
	run_kitty("nvim")
end run

