windowTitles := Object()
activeTime := Object()

SetTimer, WindowTally, 1000
Return

WindowTally:
   WinGetTitle, title, A

   IfInString, title, Sublime
      title = Sublime

   If (activeTime[title] == "")
   {
      windowTitles.Insert(title)
      activeTime[title] := 0
   }

   activeTime[title] += 1
Return

#o::
   Loop, % windowTitles.MaxIndex()
      MsgBox % windowTitles[A_Index] " `n`n "activeTime[windowTitles[A_Index]]
Return
