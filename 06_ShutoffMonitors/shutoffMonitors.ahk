; #region Explenation
; ------------------------------------------------------------
; This script shuts off all monitors via ControlMyMonitor.exe
; ControlMyMonitor can be downloaded from:
; https://www.nirsoft.net/utils/control_my_monitor.html
; 
; some monitors lack the ability to turn off via the command line
; therefore some monitors might not be able to turn off
; ------------------------------------------------------------
; #endregion


; #region Setup
; ------------------------------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Skips the dialog box and replaces the old instance automatically.
#SingleInstance Force
; ------------------------------------------------------------
; #endregion


; #region Main
; ------------------------------------------------------------
MSGBox, 4, Monitor Controller, Shut off all monitors?

IfMsgBox, No 
    Exit
IfMsgBox, Yes
    controlMyMonitor_path := "C:\Users\Thomas\Desktop\Software\NirSoft\ControlMyMonitor\ControlMyMonitor.exe"
    monitor_list_path := "monitor_list.txt"

    ; Save the list of motiors into a text file
    Run, cmd /k %controlMyMonitor_path% /smonitors %monitor_list_path%,,hide
    Sleep 1000

    ; Read the list of monitors from the text file into an array
    FileRead, monitor_list, .\%monitor_list_path%

    ; Add the monitor_strings to an array via RegExMatch
    monitor_strings := []
    starting_position := 1
    while (found_pos:=RegexMatch(monitor_list, "Monitor Device Name\: .*", monitor_name_unclean, starting_position)) {
        ; Change the starting position of the regex search to get the next match
        starting_position := found_pos + StrLen(monitor_name_unclean)

        ; Remove "Monitor Device Name: " from the monitor name
        monitor_name := SubStr(monitor_name_unclean, 22)

        ; Add the monitor name to the array
        monitor_strings.Push(monitor_name)
    }

    ; Loop through the array and shut off the monitors
    ; some monitors cannot be shut off via ControlMyMonitor.exe, since they lack this ability
    for index, monitor_string in monitor_strings {
        Run, cmd /k %controlMyMonitor_path% /TurnOff %monitor_string%,,hide
    }

    Exit
; ------------------------------------------------------------
; #endregion