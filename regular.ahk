#f::
	Run Firefox
Return
#s::
	Run C:\wscite374\wscite\SciTE.exe
Return

#c::
	Run C:\Users\Synoviaguest\Downloads\cmder\Cmder.exe
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
	tooltip, in switcher...
	Input, key, I T5,{Esc}, n,p,t	;either wait 5 seconds to timeout, or press Esc to cancel
	tooltip,ErrorLevel: %ErrorLevel%`n-%key%- was pressed...
	If(ErrorLevel = Timeout)
	{	Return
	}
	Else If(key = "n")
	{	Send {Alt down}{Tab}{Alt up}
	}

Return

;; Equivalent to ratpoison Escape key
sc056::Gosub switcher