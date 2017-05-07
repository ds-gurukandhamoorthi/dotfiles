#f::
	Run Firefox
Return
#s::
	Run C:\Users\cdi415\Downloads\wscite365\wscite\SciTE.exe
Return

#c::
	Run D:\run\Cygwin.lnk
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

