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

^!u:: {
    currentTitle := WinGetTitle("A") ; "A" refers to the active window
    MsgBox(currentTitle)
}

#HotIf WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass")
^!p:: {

    ; Get the unique window handle (HWND) of the active window
    hWnd := WinGetID("A")

    ; Get all open explorer windows
    shellApp := ComObject("Shell.Application")
    for oWin in shellApp.Windows {
        
        ; Check if the current window is the current ACTIVE window
        if (oWin.HWND == hWnd) {
            ; Trim any trailing backslashes
            vDir := Trim(oWin.Document.Folder.Self.Path, "\")  

            ; If path starts with wsl add \\
            if (SubStr(vDir, 1, 3) = "wsl") {
                vDir := "\\" vDir
            }

            ; Check if the directory exists
            if !CmdIsDir(vDir) {
                return
            }

            ; Open in terminal
            Run("wt -d" . "`"`"" . vDir . "`"`"")
            
            ; Wait for the Windows Terminal window to appear
            Sleep(10)          
            WinWaitActive("Windows PowerShell")

            ; Send 'wsl' command followed by Enter
            Send("wsl`n")
        }
    }

}

; ------------------------------------------------------------
; #endregion

; #region Functions
; ------------------------------------------------------------

CmdIsDir(path) {
    ; Command to check if a directory exists using cmd.exe
    cmd := "if exist " . "`"`"" . path . "`"`"" . " (echo True) else (echo False)"
    
    output := RunWaitOneSilent(cmd)
    if (StrCompare("True", output)) {
        return True
    } else {
        return False
    }
}

RunWaitOneSilent(command) {
    shell := ComObject("WScript.Shell")
    ; Execute the command silently via cmd.exe, hide the window
    exec := shell.Exec(A_ComSpec " /C " command)
    ; Wait for the process to finish
    while !exec.Status
        Sleep(50)
    ; Return the output of the command
    return exec.StdOut.ReadAll()
}

; ------------------------------------------------------------
; #endregion
