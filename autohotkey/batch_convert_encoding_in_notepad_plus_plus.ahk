; Batch convert encoding in Notepad++
; First please open Notepad++, Find `Settings` `Shortcut mapper` `Main menu` `Convert to UCS-2 Little Endian` set keyboard shortcut to `Ctrl+Alt+3`.

^!v::
InputBox, FileCount, Batch convert encoding, Please input the number of files, , 320, 120
Loop, %FileCount%
{
  Send ^!3
  sleep 50
  Send ^s
  sleep 50
  Send ^w
  sleep 50
}
return
