#NoEnv
; #NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ----------------- SCRIPT 1 - START --------------------------
; Ctrl + . hotkey that turns off the monitor.
^.::
; Give user a chance to release keys (in case their release would wake up the monitor again).
Sleep 1000
; Turn Monitor Off:
; 0x112 is WM_SYSCOMMAND, 0xF170 is SC_MONITORPOWER.
SendMessage, 0x112, 0xF170, 2,, Program Manager
; Note for the above: Use -1 in place of 2 to turn the monitor on.
; Use 1 in place of 2 to activate the monitor's low-power mode.
return
; ----------------- SCRIPT 1 - END --------------------------

; ----------------- SCRIPT 2 - START --------------------------
; Win+L Locks system and turns off monitor
#l::
Run,%A_WinDir%\System32\rundll32.exe user32.dll`,LockWorkStation
Sleep 1500
SendMessage 0x112, 0xF170, 2,,Program Manager
return
; ----------------- SCRIPT 2 - END --------------------------

; ----------------- SCRIPT 3 - START --------------------------
; Opens a command prompt with the current folder / Current folder with command prompt
; Key press Ctrl+Alt+C in Explorer

^!c::
if WinActive("ahk_class CabinetWClass") 
or WinActive("ahk_class ExploreWClass")
{
 ClipSaved := ClipboardAll
 Send !d
 Sleep 10
 Send ^c
 Run, cmd /K "cd /D `"%clipboard%`""
 Clipboard := ClipSaved
 ClipSaved =
 return
}
else if WinActive("ahk_class ConsoleWindowClass") 
{
 Send ^c 
 Sleep 10
 Send explorer .{Enter}
 Sleep 10
 return
}
exit
; ----------------- SCRIPT 3 - END --------------------------

; ----------------- SCRIPT 4 - START --------------------------
; Show message box for 3 seconds
#h::
MsgBox, 0, G33k5 Rule !!! , Hot Keyz: `n` Ctrl+. - Monitor Off `n` Win+L - Lock and Monitor Off `n` Ctrl+Alt+C - Cmd Prompt `n` `n` Copyright ©2000-2012 Technoholic, 10
return
; ----------------- SCRIPT 4 - END --------------------------