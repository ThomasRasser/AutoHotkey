; #region Explenation
; ------------------------------------------------------------
; This script moves the current active window to the position of the mouse cursor. 
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
; Shortcut: Win + w
#w::
    WinGetTitle, Title2, A

    ; Activate top window 
    WinActivate, %Title2%

    ; This un-maximizes fullscreen things to prevent UI bug. 
    WinRestore, %Title2%

    ; Mouse screen coords = mouse relative + win coords therefore..
    WinGetPos, xtemp, ytemp,,, A ; get active windows location
    MouseGetPos, X, Y   ; get mouse location 

    ;; Calculate actual position
    ;; -16 on x and y pos allows you to doubleclick and close window(most of the time) 
    xpos:=X+xtemp-16
    ypos:=Y+ytemp-16

    WinMove, %Title2%, , %xpos%, %ypos%  ; move window to mouse
Return
; ------------------------------------------------------------
; #endregion