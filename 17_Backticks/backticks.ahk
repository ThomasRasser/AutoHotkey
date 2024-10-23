; Fix the weird backtick behaviour for iso-german keyboards
; -----------------------------

´::
{
    SendText("´")
}
^´::
{
    SendText("´´´")
}

; -----------------------------

`::
{
    SendText("``")
}
^`::
{
    SendText("``````")
}