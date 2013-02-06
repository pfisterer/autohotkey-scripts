clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

Send, {F2}
Send, ^a
Send, ^c
Send, {ESC}

ClipWait  ; Wait for the clipboard to contain text.
FileName = %clipboard%

; Start off empty to allow ClipWait to detect when the text has arrived.
clipboard =  

Send, {F4}
Send, ^a
Send, ^c
Send, {ESC}

; Wait for the clipboard to contain text.
ClipWait  

FilePath = %clipboard%

AbsoluteFileName = %FilePath%\%FileName%

Run, c:\Program Files (x86)\Microsoft Office\Office12\WINWORD.EXE "%AbsoluteFileName%", , , WordPid

WinWait ahk_pid %WordPid%

Sleep, 300

Send, {Enter}

Send, !l




