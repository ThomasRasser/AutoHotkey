; #region Explenation
; ------------------------------------------------------------
; This script presses the left mouse button
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
; Shortcut: Shift + F8
+*F8::
  Click
Return
; ------------------------------------------------------------
; #endregion