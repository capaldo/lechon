; ======================
; capslock2hyper
; ======================

#NoEnv 
#UseHook
#InstallKeybdHook
#SingleInstance force
SendMode Input
SetCapslockState, AlwaysOff

~Capslock::
 Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}
 KeyWait, Capslock
 Send {Ctrl Up}{Shift Up}{Alt Up}{LWin Up}
 if (A_PriorKey = "Capslock") {
     Send {Esc}

 }
return

; ======================
; miscellaneous
; ======================

; reload ahk (either due to newly added script or to stop running macro)
; ======================
#x::Reload

; open a blank notepad
; ======================
~Capslock & n::
IfWinExist Untitled - Notepad
   WinActivate
else
   Run Notepad
return

; get mouse position
; ======================
~Capslock & m::
MouseGetPos, xpos, ypos
MsgBox, The cursor is at X%xpos% Y%ypos%.
return

; opens cerner login
; =================
#!^F1::Run http://cernerm/

; ======================
; combo stuff
; ======================

; open new chart and insert template
; ===============================
~Capslock & o::
MouseGetPos x, y
Send !p
Sleep 100
MouseMove 1163, 585
Sleep 100
Send n
Sleep 50
Send d
Sleep 50
Send {Enter}
MouseMove %x%, %y%
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 4000
Click 1080, 395, 2
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 2500
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send [hgen ; CHANGE to hpi autotext
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send [rgen ; CHANGE to ros autotext
Sleep 1200
Send {Enter}
Loop, 1 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send [pgen ; CHANGE to pe autotext
Sleep 1200
Send {Enter}
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send [mdm_per ; CHANGE to mdm autotext
Sleep 1200
Send {Enter}
; attestation starts here
Loop, 6 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send {Enter}
Sleep 50
Send [attest ; CHANGE to attestation autotext
Sleep 1200
Send {Enter}
Sleep 50
; go back to the hpi
Send ^f
WinWait, Find
Send History of Present
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 50
Send {Tab}
Sleep 50
Send {End}
Sleep 50 
Send {Space}
return

; ======================
; bolding
; ======================

; whole line
; ======================
!b::
Send {Home}
Sleep 100
Send +{Down}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return

; bold right of caret
; ======================
~Capslock & l::
Send +{End}
Sleep 200
Send ^b
Sleep 200
Send {Right DownTemp}
return

; bold left of caret
; ======================
~Capslock & j::
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right DownTemp}
return

; ======================
; change list item and bold
; ======================

; select up the list item ahead of the caret
; ======================
~Capslock & i::
Send {F9}
Sleep 100
Send {Up}
Sleep 100
Send {Enter}
Sleep 100
Send +{F9}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return

; select down the list item ahead of the caret
; ======================
~Capslock & k::
Send {F9}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 100
Send +{F9}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return

