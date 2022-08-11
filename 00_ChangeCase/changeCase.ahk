; #region Explenation
; ------------------------------------------------------------
; This script changes the case of selected text, 
; based on the first letter. 
; If it's capital everything will turned to lowercase,
; if it's lowercase everything will turned to uppercase.
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
; Shortcut: Shift + Ctrl + Alt + C
+^!c::	
	Send, ^c
	Sleep, 100
	text = %clipboard%
	
	StringRight, lastCharacter, text, 1 
	
	StringCaseSense, On
	UpperCase := "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
	IfInString, UpperCase, %lastCharacter%
	{
		StringLower, clipboard, text
	}	
	else 
	{
		StringUpper, clipboard, text
	}
		
	Send, ^v
Return
; ------------------------------------------------------------
; #endregion


