#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; if alt + q is pressed
; Go from bullet list mode to question mode
!q::
  Sleep, 500
  Send, {Enter}
  Sleep, 10
  Send, {Enter}
  Sleep, 10
  Send, {Backspace}
  Sleep, 10
  Send, >{Space}
  Sleep, 10
  Send, ^b
  Return

; if alt + q is pressed
; Go from bullet list mode to question mode
; !q::
;   Send, +{Tab}
;   Sleep, 10
;   Send, {Backspace}
;   Sleep, 10
;   Send, >{Space}
;   Sleep, 10
;   Send, ^b
;   Return
; 
; ; if alt + w is pressed
; ; Go from question mode to bullet list mode
; !w::
;   Send, {Enter}
;   Sleep, 10
;   Send, -{Space}
;   Return

  