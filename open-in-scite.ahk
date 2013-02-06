clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

Send, {F2}
Send, ^a
Send, ^c
Send, {ESC}

ClipWait  ; Wait for the clipboard to contain text.
FileName = %clipboard%

clipboard =  ; Start off empty to allow ClipWait to detect when the text has arrived.

Send, {F4}
Send, ^a
Send, ^c
Send, {ESC}

ClipWait  ; Wait for the clipboard to contain text.

FilePath = %clipboard%

AbsoluteFileName = %FilePath%\%FileName%

;Run, Target [, WorkingDir, Max|Min|Hide|UseErrorLevel, OutputVarPID]

Run, C:\Program Files (x86)\Scintilla Text Editor\SciTE.exe "%AbsoluteFileName%"





