#Requires AutoHotkey v2.0+

; #region Explanation
; ------------------------------------------------------------
; Script Name: [Script Name]
; Description: [Brief description of the script's purpose]
; Author: Thomas Rasser
; Date: [Creation Date]
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

^!+e::Example()

; ------------------------------------------------------------
; #endregion

; #region Functions
; ------------------------------------------------------------
Example() {
    MsgBox %A_ScriptName%
}
; ------------------------------------------------------------
; #endregion

; #region Main Logic
; ------------------------------------------------------------

; ------------------------------------------------------------
; #endregion
