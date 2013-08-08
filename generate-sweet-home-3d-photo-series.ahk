; http://www.autohotkey.com/docs/commands/FileSetTime.htm#YYYYMMDD
; MUST use this format (YYYYMMDDHHMMSS), otherwise, it will not work
startDate := 20130205123400
endDate   := 20130205133600

myDate := startDate

Loop 
{
	;Bring Sweet Home 3D window to the front
	SetTitleMatchMode, 2
	WinActivate, Sweet Home 3D

	;Open the Create photo dialog
	Send, !vh
	Sleep, 500
	
	;Send the next Date to the input
	Send, !d
	Sleep, 500
	Send, ^a
	Send, {Backspace}
	FormatTime, myTextValue, %myDate%, MM/dd/yyyy
	Send, %myTextValue%
	Sleep, 500

	;Send the next Time to the input
	Send, !t
	Sleep, 500
	Send, ^a
	Send, {Backspace}
	FormatTime, myTextValue, %myDate%, HH:mm
	Send, %myTextValue%
	Sleep, 500

	;Start photo creation
	Send, !c

	;Wait until the Save... button is active
	Loop 
	{
		Sleep, 1000
		PixelGetColor, color, 240, 613
		
		if( color == 0xF4F4F4 )
			continue
			
		break
	}

	;Click the Save... button
	Send, !s
	Sleep, 500
	
	;Enter the next filename and press enter to close the dialog
	Send, FIA-%myDate%{Enter}
	
	;Wait until file has been saved and close the dialog
	Sleep, 1000
	Send, {ESC}

	;Add 1 hour to the current date and check whether we are done
	EnvAdd, myDate, 1 , Hours
	
	if( myDate > endDate )
		break
		
}

MsgBox "Done (myDate: %myDate% > endDate %endDate%)"
