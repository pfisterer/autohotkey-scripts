SetTitleMatchMode, 2

IfWinActive, Outlook
{
    Send, ^g
    Sleep, 100
    Send, h
	Send, {Enter}
}
