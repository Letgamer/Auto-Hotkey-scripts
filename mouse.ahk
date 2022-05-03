#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
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
; G6
F15::
Send 3
return
; G7
F16::
While GetKeyState("F16","P")
  {
    MouseClick, Right
    Sleep, 45 ; every 10 miliseconds
  }
return
; G8
F17::
While GetKeyState("F17","P")
  {
    MouseClick, Left
    Sleep, 45 ; every 10 miliseconds
  }
return
; G10
F19::
Send 8
return
; G11
F20::
Send 8
return
; G12
F21::
Send 9
return

#UseHook On
F12::
WinGet, TempWindowID, ID, A
If (WindowID != TempWindowID)
{
  WindowID:=TempWindowID
  WindowState:=0
}
If (WindowState != 1)
{
  WinGetPos, WinPosX, WinPosY, WindowWidth, WindowHeight, ahk_id %WindowID%
  WinSet, Style, -0xC40000, ahk_id %WindowID%
  WinMove, ahk_id %WindowID%, , 0, 0, A_ScreenWidth, A_ScreenHeight
  ;Hide Windows Task Bar and Start Button. (Remove the following two lines if you don't want that behaviour)
  WinHide ahk_class Shell_TrayWnd
  WinHide Start ahk_class Button
}
Else
{
  WinSet, Style, +0xC40000, ahk_id %WindowID%
  WinMove, ahk_id %WindowID%, , WinPosX, WinPosY, WindowWidth, WindowHeight
  ;Show the task bar again
  WinShow ahk_class Shell_TrayWnd
  WinShow Start ahk_class Button
}
WindowState:=!WindowState
return