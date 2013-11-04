/**
 * Track your windows activities.
 *
 * Intended for personal use only.
 *
 * @dufferzafar
 */

/**
 * Script Settings
 *
 * Do not touch if you are unsure of anything.
 */
#NoEnv
#SingleInstance Force
#Persistent
#NoTrayIcon
#KeyHistory 0
SetWorkingDir %A_ScriptDir%

Version := "v0.1"


/**
 * Global Variables
 *
 * Edit only if you are sure enough.
 */


; ######################## Default Setup ########################

; OnExit, Exit

; Create a group of explorer windows
GroupAdd, Explorer, ahk_class CabinetWClass
GroupAdd, Explorer, ahk_class Progman

; Modify the Menu
Menu, Tray, NoStandard
Menu, Tray, Tip, Time Tracker ; %Version%

Menu, Tray, Add, &Suspend, SuspendMe
Menu, Tray, Add, &Exit, CloseMe

; Set the icon if it exist
IfExist, %A_ScriptDir%\Data\Time.ico
   Menu, Tray, Icon, %A_ScriptDir%\Data\Time.ico

Menu, Tray, Icon  ;Else show default icon

; Let the user know we have started
TrayTip, Time Tracker %Version%,
(

Your time is being monitored.
)
SetTimer, RemoveTrayTip, 2500

; ######################## Real Code Begins ########################

wProcess := Object()
activeTime := Object()

; Monitor Active Window every 3 seconds
SetTimer, WindowTally, % 3 * 1000

; Output Data every 15 minutes
SetTimer, FlushToFile, % 15 * 60 * 1000

Return

WindowTally:
   ; WinGet, PName, ProcessName, A
   WinGet, PPath, ProcessPath, A

   ; FileGetVersionInfo_AW(PPAth).ProductName

   title := PPath

   If (activeTime[title] == "")
   {
      wProcess.Insert(title)
      activeTime[title] := 0
   }

   activeTime[title] += 3
Return

#o::
FlushToFile:
   FileDelete, OutputData.txt
   Loop, % wProcess.MaxIndex()
      FileAppend, % wProcess[A_Index] " `t`t "activeTime[wProcess[A_Index]] "`n", OutputData.txt
Return

RemoveTrayTip:
   SetTimer, RemoveTrayTip, Off
   TrayTip
Return

SuspendMe:
   Suspend, Toggle
Return

CloseMe:
   ExitApp

#Include Data\Includes\FileGetVersionInfo.ahk
