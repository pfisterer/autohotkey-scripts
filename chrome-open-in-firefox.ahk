IfWinActive ahk_class Chrome_WidgetWin_1
{

	BackupClipbrd := Clipboard
	Sleep 50

	Send !d
	Send ^a
	Send ^c

	URL := Clipboard
	Sleep 50

	Clipboard := BackupClipbrd

	RegExMatch(URL,"^((ht|f)tps?|file)://\S+$",URL2)

	if URL2 <> 
	{
		;MsgBox %URL%
		Run "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" %URL2%
	}

}