#Requires AutoHotkey v2.0+

; #region Explanation
; ------------------------------------------------------------
; Script Name: FileCreator
; Description: Creates a new file in the explorer 
;              similar to ctrl+shift+n creates new directories
; Author: Thomas Rasser
; Date: 23-10-2024 21:40
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

#HotIf WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass")
^+t:: {
    vDotExt := ".txt"

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

            ; Generate a unique file name using new_file_<date_time>
            TimeString := FormatTime(,"yyyyMMdd_HHmmss")
            vName := "new_file_" . TimeString
            vPath := vDir "\" vName . vDotExt

            if FileExist(vPath) {
                break
            }

            ; Create a blank text file with UTF-8 encoding
            FileAppend("", vPath, "UTF-8")

            ; Refresh Explorer to show the new file
            oWin.Refresh()
            Sleep(150) ; Small delay to allow the file to appear

            ; Select and rename the newly created file
            item := oWin.Document.Folder.ParseName(vName . vDotExt)
            if (item) {
                oWin.Document.SelectItem(item, 1) ; Select the file
                Sleep(150) ; Small delay to ensure file selection
                Send("{F2}") ; Initiate rename mode
            }
            
            break
        }
    }
}


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