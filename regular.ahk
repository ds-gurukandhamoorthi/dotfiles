
StringCaseSense, On
SetKeyDelay, 0

#f:: Gosub ror_firefox

#s:: Gosub ror_scintilla

;; ide
#i:: Gosub ror_sts

#c:: Gosub ror_console

	
Return

	

#+c::
	Run calc
Return

#n::
	Run "C:\Program Files\NetBeans 8.0.2\bin\netbeans64.exe"
Return

#v::
	Run "C:\Program Files\SumatraPDF\SumatraPDF.exe"
Return


^Enter::
	Send {End}
	Send +{Home}
	Send {F5}
Return

PrintScreen::
	Run "D:\ChangeWallpaper.jar"
Return




CapsLock::Send {Alt down}{Tab}{Alt up}
^NumpadDot::Send {ASC 0044}
+NumpadDiv::Send {:}
+NumpadSub::Send {_}

#IfWinActive ahk_exe SumatraPDF.exe
VKE2::Send !{TAB}
BackSpace::Send +{Space}
#IfWinActive


#IfWinActive ahk_exe netbeans64.exe
Volume_Mute::Send {F6}
#IfWinActive

;; https://autohotkey.com/board/topic/17314-how-to-switch-next-and-previous-window/
switcher:
	;;tooltip, in switcher...
	Input, key, M I C T2,{Esc}, n,f,i,s,c,k, ,	;either wait 2 seconds to timeout, or press Esc to cancel
	tooltip,ErrorLevel: %ErrorLevel%`n-%key%- was pressed...
	If(ErrorLevel = Timeout)
	{	Return

;;;;;;;;;;;;;;;;    case sensitive }Else If(RegExMatch(key, "k")){
;;;;;;;    == case sensitive
}Else If(key == "k"){
	Gosub kill
	}
	Else If(key = "n" || key = " "){
	Send {Alt down}{Tab}{Alt up}
	}
	Else If(key = "f"){
	Gosub ror_firefox
	}
	Else If(key = "s"){
	Gosub ror_scintilla
	}	Else If(key = "i"){
	Gosub ror_sts
	}	Else If(key = "c"){
	Gosub ror_console
}
	

Return

;; Equivalent to ratpoison Escape key
sc056::Gosub switcher



return

;; ror = run or raise
ror_firefox:
	if WinExist("ahk_exe firefox.exe")
    		WinActivate, ahk_exe firefox.exe
	else
   		Run Firefox
return
ror_scintilla:
	if WinExist("ahk_exe scite.exe")
    		WinActivate, ahk_exe scite.exe
	else
   		Run C:\wscite374\wscite\SciTE.exe
return
ror_sts:
	if WinExist("ahk_exe sts.exe")
    		WinActivate, ahk_exe sts.exe
	else
   		Run C:\wscite374\wscite\SciTE.exe
return
ror_console:
	if WinExist("ahk_exe cmder.exe")
		WinActivate, ahk_exe cmder.exe
	else
		Run C:\Users\Synoviaguest\Downloads\cmder\Cmder.exe
return
kill:
	;Send {Alt down}{F4}{Alt up}
	WinClose, A
return