#SingleInstance Force

^+y:: ; Ctrl + Shift + y
{
    BrowserProcessNames := ["msedge.exe", "brave.exe"]
    ActiveWindowProcessName := WinGetProcessName("A")
    If (ActiveWindowProcessName = BrowserProcessNames.Get("1") or ActiveWindowProcessName = BrowserProcessNames.Get("2"))
    {
        SendInput("^c")
        Sleep(1)
        ClipWait(2) ;wait (max 2 secs) for clipboard to contain something
        If (A_Clipboard  != "")
        {
            SendInput("^t")
            SendInput("^v")
            SendInput("{Enter}")
        }
    }
    Else
    {
        SendInput("^c")
    }
    return
}