(* Neovim Kitty Launcher
 * CC BY-SA 4.0
 * © 2026 haesemeyer <haesemeyer@mailbox.org>
 * codeberg.org/haesemeyer/mac-tools
 *)

-- function to check if applicatiton is currently running
on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

on run {input, parameters}

	-- command definition
	set cmd to "nvim"
	if input is not {} then
		set filePath to POSIX path of input
		set cmd to "nvim \"" & filePath & "\""
	end if

	-- start kitty terminal
	if is_running("kitty") then
		tell application "System Events" to tell process "kitty"
			click menu item "New OS Window" of menu 1 of menu bar item "Shell" of menu bar 1
		end tell
	end if

	-- focus kitty (and start if not already started)
	tell application "kitty" to activate

	-- enter command as keystrokes
	tell application "System Events"
		keystroke cmd
		key code 36
	end tell

end run

