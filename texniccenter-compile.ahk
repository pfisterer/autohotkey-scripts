
SetTitleMatchMode, 2

IfWinActive, Word
{
    Send, ^s
    Sleep, 100
    Send, !J
}

SetTitleMatchMode, 2
ControlSend, , {F7}, TeXnicCenter
