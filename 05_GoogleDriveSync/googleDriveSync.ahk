; #region Explenation
; ------------------------------------------------------------
; Google drive somehow chockes while synchronising my data
; Everytime it stops, I have to restart it.
; Therefore this script is used to stop/start it automatically every 10 minutes
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
; Delete all running google drive instances
Run, cmd /k "taskkill /f /im GoogleDriveFS.exe",,hide
Sleep, 3000 ; 3 Seconds

; Delete all running dropbox instances and open them again
Loop, 100 { ; 7min*25 = ~3 hours
    Run, cmd /k "C:\Program Files\Google\Drive File Stream\61.0.3.0\GoogleDriveFS.exe",,hide
    Sleep, (1000*60*7) ; 7 Minutes
    Run, cmd /k "taskkill /f /im GoogleDriveFS.exe",,hide
    Sleep, 3000 ; 3 Seconds
}

MsgBox "Program finished"
; ------------------------------------------------------------
; #endregion