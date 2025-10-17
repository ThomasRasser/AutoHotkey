#Requires AutoHotkey v2.0+

; #region Explanation
; ------------------------------------------------------------
; Script Name: OpenInTerminal
; Description: Opens the current folder in the windows terminal powershell
; Author: Thomas Rasser
; Date: 23-10-2024 23:38
; ------------------------------------------------------------
; #endregion

; #region Settings
; ------------------------------------------------------------
#SingleInstance Force  ; Ensures only one instance of the script is running
; ------------------------------------------------------------
; #endregion

; #region Hotkeys
; ------------------------------------------------------------
; Ctrl = ^, Alt = !, Shift = +
; ------------------------------------------------------------

´::
{
    SendText("´")
}
^´::
{
    SendText("´´´")
}

; -----------------------------

`::
{
    SendText("``")
}
^`::
{
    SendText("``````")
}

; ------------------------------------------------------------
; #endregion
