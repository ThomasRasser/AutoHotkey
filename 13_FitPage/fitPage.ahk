; #region Explenation
; ------------------------------------------------------------
; The pdf viewer in edge uses ctrl+\ as shortcut to fit the pdf to the screen
; This is not possible with a german iso key layout
; Therefore it will be simulated via altgr+f
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
; Shortcut: altgr + f
<^>!f::
  ; Send ctrl + \
  Send, {RWinUp}{Ctrl Down}{\}{Ctrl Up}
Return

<^>!a::
  ; Send ctrl + \
  Send, {RWinUp}{Ctrl Down}{[}{Ctrl Up}
Return

<^>!s::
  ; Send ctrl + \
  Send, {RWinUp}{Ctrl Down}{]}{Ctrl Up}
Return

; ------------------------------------------------------------
; #endregion