(* Kitty Launcher
 * CC BY-SA 4.0
 * © 2026 haesemeyer <haesemeyer@mailbox.org>
 * codeberg.org/haesemeyer/mac-tools
 *)

on run

	-- check if kitty is already running
	set already_running to (application "kitty" is running)

	-- focus kitty (and start if not already running)
	tell application "kitty" to activate

	-- if kitty was already running, send keystroke to open new window
	if already_running then
		tell application "System Events" to keystroke "n" using command down
	end if

end run

