#NoEnv
; #Warn
SendMode Input  
SetWorkingDir %A_ScriptDir%  
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
<::
Send {Shift Down}
KeyWait, Shift, D

Loop, 3 {
  y := 415 + (A_Index-1) * 35
  Loop, 9 {
    x := 815 + (A_Index-1) * 35
    Send {Click %x%,%y%}
    KeyWait LButton, U
    Random, randtime, 30, 50
    Sleep %randtime%
  }
}

Send {Shift Up}
return