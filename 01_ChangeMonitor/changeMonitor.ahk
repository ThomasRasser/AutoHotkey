; #region Explenation
; ------------------------------------------------------------
; This script changes the monitor input via ControlMyMonitor.exe
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
; Shortcut: Ctrl + Alt + m
^!m::
    ; Define buttons
    Gui, Add, Button, Default w110, Laptop
    Gui, Add, Button, w110 xp+120, Raspberry Pi

    ; Show GUI
    Gui, Show,, Monitor select
Return

; Scripts for changing monitor input source
ButtonLaptop:
    Run, cmd /k "C:\Users\Thomas\Desktop\Software\NirSoft\ControlMyMonitor\ControlMyMonitor.exe /SetValueIfNeeded \\.\DISPLAY3\Monitor0 60 15",,hide
    Gui, Destroy
Return

ButtonRaspberryPi:
    Run, cmd /k "C:\Users\Thomas\Desktop\Software\NirSoft\ControlMyMonitor\ControlMyMonitor.exe /SetValueIfNeeded \\.\DISPLAY3\Monitor0 60 17",,hide
    Gui, Destroy
Return

GuiClose:
    Gui, Destroy
Return
; ------------------------------------------------------------
; #endregion