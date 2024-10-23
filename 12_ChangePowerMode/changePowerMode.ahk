; #region Explenation
; ------------------------------------------------------------
; Presents a popup menu to change the windows power mode:
; modes
;  - Balanced
;  - High Performance
;  - Power Saver
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

; Shortcut: altgr + p
; Open the popup menu with 3 buttons to change the power mode.
; Also shows the current power mode.
<^>!p::
    ; Get current scheme with cmd command: powercfg /getactivescheme
    PowerModes := { "a1841308-3541-4fab-bc81-f71556f20b4a": "High Performance", "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c": "Power Saver", "381b4222-f694-41f0-9685-ff5bb260df2e": "Balanced"}

    RunWait, %ComSpec% /c powercfg /getactivescheme > %A_ScriptDir%\powercfg.txt,, Hide
    FileRead, PowercfgResult, %A_ScriptDir%\powercfg.txt

    CurrentPowerModeCode := SubStr(PowercfgResult, InStr(PowercfgResult, ":") + 2, 36)
    CurrentPowerModeName := PowerModes[CurrentPowerModeCode]

    ; GUI to change the power mode
    Gui, Add, Text, w200 h20, Current power mode: %CurrentPowerModeName%
    Gui, Add, Button, w200 h20, High Performance
    Gui, Add, Button, w200 h20, Balanced
    Gui, Add, Button, w200 h20, Power Saver
    Gui, Add, Button, w200 h20, Cancel
    Gui, Show, w220 h150, Power Mode
    Gui, +AlwaysOnTop

Return

; Change the power mode to High Performance
ButtonHighPerformance:
    HighPerormanceCode := "a1841308-3541-4fab-bc81-f71556f20b4a"
    RunWait, %ComSpec% /c powercfg /setactive %HighPerormanceCode%,, Hide
    Gui, Destroy
Return

; Change the power mode to Balanced
ButtonBalanced:
    BalancedCode := "381b4222-f694-41f0-9685-ff5bb260df2e"
    RunWait, %ComSpec% /c powercfg /setactive %BalancedCode%,, Hide
    Gui, Destroy
Return

; Change the power mode to Power Saver
ButtonPowerSaver:
    PowerSaverCode := "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
    RunWait, %ComSpec% /c powercfg /setactive %PowerSaverCode%,, Hide
    Gui, Destroy
Return

; Close the popup menu via the cancel button
ButtonCancel:
    Gui, Destroy
Return

; Close the popup menu via the X button
GuiClose:
    Gui, Destroy
Return

; ------------------------------------------------------------
; #endregion
    