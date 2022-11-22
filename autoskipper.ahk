#InstallKeybdHook
#SingleInstance, Force
SetBatchLines -1
Thread, Interrupt, 0

toggle := 0

setTimer, setTip, 5
TTStart = %A_TickCount%
while (A_TickCount - TTStart < 10000 && !toggle)
{
  TooltipMsg = Press `` (backtick) to toggle autoclicker`nThe autoclicker will only click when the Genshin Impact window is active
}
TooltipMsg = ##Autoclick enabled.

~Capslock::
toggle := !toggle
if (toggle) {
    setTimer, setTip, 5
    TTStart = %A_TickCount%
    TooltipMsg = ##Autoclick enabled.
    SetTimer, autoclick, 200
}
else {
    setTimer, setTip, 5
    TooltipMsg = ##Autoclick disabled.
    TTStart = %A_TickCount%
    SetTimer, autoclick, off
}
return

~LAlt::
if (toggle) {
    SetTimer, autoclick, off
    Keywait, LAlt, U
    SetTimer, autoclick, on
}
return

~RAlt::
if (toggle) {
    SetTimer, autoclick, off
    Keywait, RAlt, U
    SetTimer, autoclick, on
}
return

autoclick:
If WinActive("ahk_exe GenshinImpact.exe") {
    MouseClick, left, 1290, 668
}
return

setTip:
  StringReplace, cleanTTM, TooltipMsg, ##
  Tooltip, % cleanTTM
  if (InStr(TooltipMsg, "##") && A_TickCount - TTStart > 1000)
    TooltipMsg =
  if TooltipMsg =
  {
    Tooltip
    setTimer, setTip, off
  }
return