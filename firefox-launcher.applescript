(* Firefox Launcher
 * CC BY-SA 4.0
 * © 2026 haesemeyer <haesemeyer@mailbox.org>
 * codeberg.org/haesemeyer/mac-tools
 *)

-- function to check if applicatiton is currently running
on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

on run {input, paramterets}

	-- check if firefox is already running
	set already_running to is_running("firefox")

	-- focus firefox (and start if not already running)
	tell application "firefox" to activate

	-- if firefox was already running, send keystroke to open new window
	if already_running then
		tell application "System Events" to keystroke "n" using command down
	end if

end run

