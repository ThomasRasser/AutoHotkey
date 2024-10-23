; AutoHotkey v2 Script
; Disable default PgUp and PgDn actions and switch virtual desktops instead

PgDn::
{
    Send #^{Right}  ; Win + Ctrl + Right to switch to the next virtual desktop
    return
}

PgUp::
{
    Send #^{Left}  ; Win + Ctrl + Left to switch to the previous virtual desktop
    return
}
