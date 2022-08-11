; #region Explenation
; ------------------------------------------------------------
; This script sets the notebook into sleepmode emediately.
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
; Set the netobook into sleep mode
Run rundll32.exe powrprof.dll`, SetSuspendState Sleep,,hide
; ------------------------------------------------------------
; #endregion