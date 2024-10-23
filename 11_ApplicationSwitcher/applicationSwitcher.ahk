; #region Explanation
; ------------------------------------------------------------
; This script changes the active window to the designated window
; or opens the application if it is not already running
; ------------------------------------------------------------
; #endregion

; Skips the dialog box and replaces the old instance automatically.
#SingleInstance Force
; ------------------------------------------------------------
; #endregion


; #region Main
; ------------------------------------------------------------

; Change the active window to the one with the given process name 
; in the current virtual desktop
ChangeActiveWindowByProcess(ProcessName) {
  IsOpen := false
  ids := WinGetList()
  for this_id in ids
  {
      this_windowTitle := WinGetTitle(this_id)
      this_processName := WinGetProcessName(this_id)
      if (this_processName = ProcessName)
      {
          WinActivate(this_id)
          IsOpen := true
          break
      }
  }

  if (IsOpen = false)
  {
    if (ProcessName = "code.exe")
    {
      MsgBox("Visual Studio Code is not open")
    }
    else if (ProcessName = "WindowsTerminal.exe")
    {
      Run("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WSL.lnk")
    }
    else
    {
      Run(ProcessName)
    }
  }
}

SetCapsLockState("AlwaysOff")

; Switch to, or start application ==============================================

CapsLock & h::
{
  ChangeActiveWindowByProcess("brave.exe")
}

CapsLock & j::
{
  ChangeActiveWindowByProcess("WindowsTerminal.exe")
}

CapsLock & k::
{
  ChangeActiveWindowByProcess("code.exe")
}

CapsLock & u::
{
  ChangeActiveWindowByProcess("sublime_text.exe")
}

CapsLock & e::
{
  Run("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Everything.lnk")
}

CapsLock & s::
{
  ChangeActiveWindowByProcess("Spotify.exe")
}

; Send brackets ================================================================

CapsLock & l::
{
  Send("(")
}

CapsLock & ö::
{
  Send("[")
}

CapsLock & 8::
{
  Send("[")
}

CapsLock & 9::
{
  Send("]")
}

CapsLock & ä::
{
  Send("{{}")
}

CapsLock & 7::
{
  Send("{{}")
}

CapsLock & 0::
{
  Send("{}}")
}

; Send buttons =================================================================

CapsLock & i::
{
  Send("{Home}")
}

CapsLock & n::
{
  Send("{End}")
}

; Simulate mouse clicks ========================================================

CapsLock & o::
{
  MouseClick("left")
}

CapsLock & p::
{
  MouseClick("right")
}


; ------------------------------------------------------------

; Show a list of all the windows in the current virtual desktop
CapsLock & w::ShowWindowsList()

ShowWindowsList()
{
  ids := WinGetList()
  for this_id in ids
  {
      this_windowTitle := WinGetTitle(this_id)
      this_processName := WinGetProcessName(this_id)
      If (this_windowTitle != "")
      {
          WinList .= this_windowTitle
          WinList .= "`n"
          WinList .= " (" . this_processName . ")"
          WinList .= "`n"
          WinList .= "`n"
      }
  }
  
    list_gui := Gui()
    list_gui.Title := "Windows List"
    list_gui.Add("Text", "w800", WinList)
    list_gui.OnEvent("Close", list_gui.Destroy)
    list_gui.OnEvent("Escape", list_gui.Destroy)
    list_gui.Show()
}

; ------------------------------------------------------------
; #endregion