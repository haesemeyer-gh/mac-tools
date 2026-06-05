(* Firefox Launcher
 * CC BY-SA 4.0
 * © 2026 haesemeyer <haesemeyer@mailbox.org>
 * codeberg.org/haesemeyer/mac-tools
 *)

on run {input, paramterets}

	-- check if firefox is already running
	set already_running to (application "Firefox" is running)

	-- focus firefox (and start if not already running)
	-- weird id syntax is required FOR THIS APPLICATION,
	-- otherwise it starts firefox even if not already running
	-- BEFORE checking wether or not it is running, causing it to
	-- open a second window on first launch...
	tell application id (id of application "Firefox") to activate

	-- if firefox was already running, send keystroke to open new window
	if already_running then
		tell application "System Events" to keystroke "n" using command down
	end if

end run

