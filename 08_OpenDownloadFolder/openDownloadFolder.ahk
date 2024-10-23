; #region Explenation
; ------------------------------------------------------------
; Open the explorer with the download and the desktop folder
; and snap them to the right and left half of the screen  
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
Run, explore C:\Users\Thomas\Downloads
WinWaitActive, Downloads
send #{left}{Lwin up}

Run, explore C:\Users\Thomas\Desktop
WinWaitActive, Desktop
send #{right}{Lwin up}
; ------------------------------------------------------------
; #endregion
