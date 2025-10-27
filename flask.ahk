#Persistent
#SingleInstance, Force

menuOpenned:=1
toggle:=0
keyPressed:=0

; Can be changed
xES = 165
yES = 1005

; Better not change
xStartLife = 118 	; const for 1920x1080	coord X for life flask
yStartLife = 872 	; const for 1920x1080
yRangeLife = 204 	; const for 1920x1080
yLife35 = 1010 		; const for 1920x1080	coord Y for life flask on low life regen

; System
flaskUtilCDx := 359
flaskUtilCDy := 1072
colorFlaskUtilCD := 0x99D7F9
cdmp := 46
gameX := 275
gameY := 1079
flaskUtil1x := 329
flaskUtil2x := 375
flaskUtil3x := 421
flaskUtil4x := 466
flaskUtil5x := 512

IniRead, menuW, main.ini, Menu, menuW
IniRead, menuH, main.ini, Menu, menuH
IniRead, comboBoxList, main.ini, Menu, comboBoxList

Gui, 1: Font, S12, Verdana
Gui, 1: -Caption
Gui, 1: Add, Button, -Wrap, AddProfile
Gui, 1: Add, Button, xp+100 w100 -Wrap, RemoveProfile
Gui, 1: Font, S16, Verdana
Gui, 1: Add, ComboBox, +vCurrentProfileName +gComboBoxChanged +AltSubmit xm w420, %comboBoxList%
Gui, 1: Add, Tab, section xm vMenuTabName w470, Flask|Propetries|Timers|Hotkeys
Gui, 1: Tab, 1
Gui, 1: Add, Checkbox, +vflaskLifeActive1 -Checked%flaskLifeActive1%, Use Instant Life flask 1?
Gui, 1: Add, Checkbox, +vflaskLifeActive2 -Checked%flaskLifeActive2%, Use Low Life flask 2?
Gui, 1: Add, Checkbox, +vesActive -Checked%esActive%, Use Discipline on low ES?
Gui, 1: Add, Checkbox, +vWarCryActive -Checked%WarCryActive%, Use WarCry?
Gui, 1: Add, Checkbox, +vflaskActive1 -Checked%flaskActive1%, Use Util flask 1?
Gui, 1: Add, Checkbox, +vflaskActive2 -Checked%flaskActive2%, Use Util flask 2?
Gui, 1: Add, Checkbox, +vflaskActive3 +Checked%flaskActive3%, Use Util flask 3?
Gui, 1: Add, Checkbox, +vflaskActive4 +Checked%flaskActive4%, Use Util flask 4?
Gui, 1: Add, Checkbox, +vflaskActive5 +Checked%flaskActive5%, Use Util flask 5?
Gui, 1: Add, Checkbox, +vPressedDown -Checked%PressedDown%, Use pressed key for detonate mine?
Gui, 1: Tab, 2
Gui, 1: Add, Text, +vTextRegen1, Regen Instant Life flask
Gui, 1: Add, Edit, xp+350 w70 r1 +vflaskLifeRegen1 Number, 979
Gui, 1: Add, Text, xp-350 yp+35 +vTextRegen2, Your Maximum Life
Gui, 1: Add, Edit, xp+350 w70 r1 +vplayerHp Number, 3000
Gui, 1: Font, S12, Verdana
Gui, 1: Add, Text, xp-350 yp+35 w450 +vTextMessage1, Some Unique flask may works bad or not works, then change the value of the lower options (1013 for common flasks) (Tell me if not work)
Gui, 1: Add, Text, +vTextMessageFlask1, Flask 1
Gui, 1: Add, Text, yp+42 +vTextMessageFlask2, Flask 2
Gui, 1: Add, Text, yp+42 +vTextMessageFlask3, Flask 3
Gui, 1: Add, Text, yp+42 +vTextMessageFlask4, Flask 4
Gui, 1: Add, Text, yp+42 +vTextMessageFlask5, Flask 5
Gui, 1: Add, Slider, xp+80 yp-170 Line1 Range1013-1023 TickInterval1 ToolTip vflaskUtil1y, 1013
Gui, 1: Add, Slider, Line1 Range1013-1023 TickInterval1 ToolTip vflaskUtil2y, 1013
Gui, 1: Add, Slider, Line1 Range1013-1023 TickInterval1 ToolTip vflaskUtil3y, 1013
Gui, 1: Add, Slider, Line1 Range1013-1023 TickInterval1 ToolTip vflaskUtil4y, 1013
Gui, 1: Add, Slider, Line1 Range1013-1023 TickInterval1 ToolTip vflaskUtil5y, 1013
Gui, 1: Tab, 3
Gui, 1: Add, Text, +vTextTimerLifeInst, Life Instant flask check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerLifeInst Number, 100
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerLife35, Low Life flask check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerLife35 Number, 49
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerES, Energy Shield check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerES Number, 49
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerUtil1, Utility flask 1 check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerUtil1 Number, 500
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerUtil2, Utility flask 2 check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerUtil2 Number, 500
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerUtil3, Utility flask 3 check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerUtil3 Number, 500
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerUtil4, Utility flask 4 check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerUtil4 Number, 500
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerUtil5, Utility flask 5 check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerUtil5 Number, 500
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerWarCry, WarCry use every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerWarCry Number, 4000
Gui, 1: Add, Text, xp-350 yp+35 +vTextTimerInGameCheck, In game check every ms
Gui, 1: Add, Edit, xp+350 w70 r1 +vTimerInGameCheck Number, 500
Gui, 1: Tab, 4
Gui, 1: Font, S10, Verdana
Gui, 1: Add, Text, +vTextHotkeyColor, Hotkey for Getting Color
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyColor, VK62
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyEnable, Hotkey for Enable Script
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyEnable, VK61
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyMenu, Hotkey for Open Menu
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyMenu, VK63
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyFlask1, Key for flask 1
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyFlask1, 1
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyFlask2, Key for flask 2
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyFlask2, 2
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyFlask3, Key for flask 3
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyFlask3, 3
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyFlask4, Key for flask 4
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyFlask4, 4
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyFlask5, Key for flask 5
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyFlask5, 5
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyES, Key for Discipline
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyES, T
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyWarCry, Key for WarCry
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyWarCry, R
Gui, 1: Add, Text, xp-300 yp+25 +vTextHotkeyNon, Key for pressed down
Gui, 1: Add, Edit, xp+300 w130 r1 +vHotkeyPressedDown, T
Gui, 1: Tab
Gui, 1: Font, S20, Verdana
Gui, 1: Add, Button, section xm, Save
Gui, 1: Add, Button, xp+395, Exit
Gui, 1: Show, Restore w%menuW% h%menuH%

Gui, 2: Color, cGreen
Gui, 2: -Caption +ToolWindow +E0x20 ; No title bar, No taskbar button, Transparent for clicks
Gui, 2: font, S16, Verdana
Gui, 2: Add, Text, c00FF00 x420 y932 vRed, Enabled
Gui, 2: +LastFound +AlwaysOnTop +ToolWindow +E0x20
WinSet, TransColor, cGreen
Gui, 2: -Caption

Hotkey, VK62, GettingColor
Hotkey, VK61, EnableScript
Hotkey, VK63, OpenMenu
return



OpenMenu:
	if(menuOpenned){
		Gui, 1: Hide
		menuOpenned:=0
	}
	else{
		Gui, 1: Show, Restore w%menuW% h%menuH%
		menuOpenned:=1
	}
return

GettingColor:
	yLifeInst := (flaskLifeRegen1 / playerHp) * yRangeLife + yStartLife ; coord Y for instant flask regen
	if(flaskLifeActive1)
	PixelGetColor, colorLifeInst, xStartLife, yLifeInst
	if(flaskLifeActive2)
	PixelGetColor, colorLife35, xStartLife, yLife35
	if(esActive)
	PixelGetColor, colorES, xES, yES
	if(flaskActive1)
	PixelGetColor, colorUtil1, flaskUtil1x, flaskUtil1y
	if(flaskActive2)
	PixelGetColor, colorUtil2, flaskUtil2x, flaskUtil2y
	if(flaskActive3)
	PixelGetColor, colorUtil3, flaskUtil3x, flaskUtil3y
	if(flaskActive4)
	PixelGetColor, colorUtil4, flaskUtil4x, flaskUtil4y
	if(flaskActive5)
	PixelGetColor, colorUtil5, flaskUtil5x, flaskUtil5y
	PixelGetColor, colorGame, gameX, gameY
return

EnableScript:
	if(toggle){
		toggle := 0
		SoundPlay, *16
		Gui 2:Hide
		SetTimer, healLifeInst, Off
		SetTimer, healLife35, Off
		SetTimer, healES, Off
		SetTimer, useUtil1, Off
		SetTimer, useUtil2, Off
		SetTimer, useUtil3, Off
		SetTimer, useUtil4, Off
		SetTimer, useUtil5, Off
		SetTimer, useWarCry, Off
		SetTimer, inGameCheck, Off
		SendEvent {%HotkeyPressedDown% up}
		keypressed:=0
	}else{
		toggle := 1
		SoundPlay, *-1
		Gui 2:Show, Maximize, Center, 1920, 1080
		IfWinExist, Path of Exile
			WinActivate
		if((PressedDown==1) and (KeyPressed==0)){
			SendEvent {%HotkeyPressedDown% down}
			SendEvent {R}
			keypressed:=1
		}
		else{
			if((PressedDown==1) and (KeyPressed==1)){
				SendEvent {%HotkeyPressedDown% up}
				keypressed:=0
			}
		}
		if(flaskLifeActive1){
			SetTimer, healLifeInst, %TimerLifeInst%
		}
		if(flaskLifeActive2){
			SetTimer, healLife35, %TimerLife35%
		}
		if(esActive){
			SetTimer, healES, %TimerES%
		}
		if(flaskActive1){
			SetTimer, useUtil1, %TimerUtil1%
		}
		if(flaskActive2){
			SetTimer, useUtil2, %TimerUtil2%
		}
		if(flaskActive3){
			SetTimer, useUtil3, %TimerUtil3%
		}
		if(flaskActive4){
			SetTimer, useUtil4, %TimerUtil4%
		}
		if(flaskActive5){
			SetTimer, useUtil5, %TimerUtil5%
		}
		if(warCryActive){
			SetTimer, useWarCry, %TimerWarCry%
		}
		SetTimer, inGameCheck, %TimerInGameCheck%
	}
return

inGameCheck:
	PixelGetColor, currentColorGame, gameX, gameY
	if (currentColorGame != colorGame){
		SoundPlay, *16
		Gui 2:Hide
		toggle := 0
		SetTimer, healLifeInst, Off
		SetTimer, healLife35, Off
		SetTimer, healES, Off
		SetTimer, useUtil1, Off
		SetTimer, useUtil2, Off
		SetTimer, useUtil3, Off
		SetTimer, useUtil4, Off
		SetTimer, useUtil5, Off
		SetTimer, useWarCry, Off
		SetTimer, inGameCheck, Off
		SendEvent {%HotkeyPressedDown% up}
		keypressed:=0
	}
return

healLifeInst:
	PixelGetColor, currentColorLifeInst, xStartLife, yLifeInst
	if(currentColorLifeInst != colorLifeInst){
		Send %HotkeyFlask1%
	}
return

healLife35:
	PixelGetColor, currentColorLife35, xStartLife, yLife35
	if(currentColorLife35 != colorLife35){
		Send %HotkeyFlask2%
	}
return

healES:
	PixelGetColor, currentColorES, xES, yES
	if(currentColorES != colorES){
		Send %HotkeyES%
	}
return

useUtil1:
	PixelGetColor, currentColorUtil1, flaskUtil1x, flaskUtil1y
	PixelGetColor, currentColorUtil1CD, % (flaskUtilCDx - cdmp), flaskUtilCDy
	if((colorUtil1 == currentColorUtil1) AND (colorFlaskUtilCD != currentColorUtil1CD)){
		Send %HotkeyFlask1%
	}
return

useUtil2:
	PixelGetColor, currentColorUtil2, flaskUtil2x, flaskUtil2y
	PixelGetColor, currentColorUtil2CD, % (flaskUtilCDx + cdmp*0), flaskUtilCDy
	if((colorUtil2 == currentColorUtil2) AND (colorFlaskUtilCD != currentColorUtil2CD)){
		Send %HotkeyFlask2%
	}
return

useUtil3:
	PixelGetColor, currentColorUtil3, flaskUtil3x, flaskUtil3y
	PixelGetColor, currentColorUtil3CD, % (flaskUtilCDx + cdmp*1), flaskUtilCDy
	if((colorUtil3 == currentColorUtil3) AND (colorFlaskUtilCD != currentColorUtil3CD)){
		Send %HotkeyFlask3%
	}
return

useUtil4:
	PixelGetColor, currentColorUtil4, flaskUtil4x, flaskUtil4y
	PixelGetColor, currentColorUtil4CD, % (flaskUtilCDx + cdmp*2), flaskUtilCDy
	if((colorUtil4 == currentColorUtil4) AND (colorFlaskUtilCD != currentColorUtil4CD)){
		Send %HotkeyFlask4%
	}
return

useUtil5:
	PixelGetColor, currentColorUtil5, flaskUtil5x, flaskUtil5y
	PixelGetColor, currentColorUtil5CD, % (flaskUtilCDx + cdmp*3), flaskUtilCDy
	if((colorUtil5 == currentColorUtil5) AND (colorFlaskUtilCD != currentColorUtil5CD)){
		Send %HotkeyFlask5%
	}
return

useWarCry:
	SendMessage, 0x50,, 0x4090409,, A ; английский
	Send %HotkeyWarCry%
return



ButtonSave:
	Gui, Submit
	NameField := SeekNameField()
	IniWrite, %flaskLifeActive1%, profiles/%NameField%.ini, Flask, flaskLifeActive1
	IniWrite, %flaskLifeActive2%, profiles/%NameField%.ini, Flask, flaskLifeActive2
	IniWrite, %esActive%, profiles/%NameField%.ini, Flask, esActive
	IniWrite, %WarCryActive%, profiles/%NameField%.ini, Flask, WarCryActive
	IniWrite, %flaskActive1%, profiles/%NameField%.ini, Flask, flaskActive1
	IniWrite, %flaskActive2%, profiles/%NameField%.ini, Flask, flaskActive2
	IniWrite, %flaskActive3%, profiles/%NameField%.ini, Flask, flaskActive3
	IniWrite, %flaskActive4%, profiles/%NameField%.ini, Flask, flaskActive4
	IniWrite, %flaskActive5%, profiles/%NameField%.ini, Flask, flaskActive5
	IniWrite, %PressedDown%, profiles/%NameField%.ini, Flask, PressedDown
	
	IniWrite, %flaskLifeRegen1%, profiles/%NameField%.ini, Properties, flaskLifeRegen1
	IniWrite, %playerHp%, profiles/%NameField%.ini, Properties, playerHp
	IniWrite, %flaskUtil1y%, profiles/%NameField%.ini, Properties, flaskUtil1y
	IniWrite, %flaskUtil2y%, profiles/%NameField%.ini, Properties, flaskUtil2y
	IniWrite, %flaskUtil3y%, profiles/%NameField%.ini, Properties, flaskUtil3y
	IniWrite, %flaskUtil4y%, profiles/%NameField%.ini, Properties, flaskUtil4y
	IniWrite, %flaskUtil5y%, profiles/%NameField%.ini, Properties, flaskUtil5y
	
	IniWrite, %TimerLifeInst%, profiles/%NameField%.ini, Timers, TimerLifeInst
	IniWrite, %TimerLife35%, profiles/%NameField%.ini, Timers, TimerLife35
	IniWrite, %TimerES%, profiles/%NameField%.ini, Timers, TimerES
	IniWrite, %TimerUtil1%, profiles/%NameField%.ini, Timers, TimerUtil1
	IniWrite, %TimerUtil2%, profiles/%NameField%.ini, Timers, TimerUtil2
	IniWrite, %TimerUtil3%, profiles/%NameField%.ini, Timers, TimerUtil3
	IniWrite, %TimerUtil4%, profiles/%NameField%.ini, Timers, TimerUtil4
	IniWrite, %TimerUtil5%, profiles/%NameField%.ini, Timers, TimerUtil5
	IniWrite, %TimerWarCry%, profiles/%NameField%.ini, Timers, TimerWarCry
	IniWrite, %TimerInGameCheck%, profiles/%NameField%.ini, Timers, TimerInGameCheck
	
	IniWrite, %HotkeyColor%, main.ini, Hotkeys, HotkeyColor
	IniWrite, %HotkeyEnable%, main.ini, Hotkeys, HotkeyEnable
	IniWrite, %HotkeyMenu%, main.ini, Hotkeys, HotkeyMenu
	IniWrite, %HotkeyFlask1%, main.ini, Hotkeys, HotkeyFlask1
	IniWrite, %HotkeyFlask2%, main.ini, Hotkeys, HotkeyFlask2
	IniWrite, %HotkeyFlask3%, main.ini, Hotkeys, HotkeyFlask3
	IniWrite, %HotkeyFlask4%, main.ini, Hotkeys, HotkeyFlask4
	IniWrite, %HotkeyFlask5%, main.ini, Hotkeys, HotkeyFlask5
	IniWrite, %HotkeyES%, main.ini, Hotkeys, HotkeyES
	IniWrite, %HotkeyWarCry%, main.ini, Hotkeys, HotkeyWarCry
	IniWrite, %HotkeyPressedDown%, main.ini, Hotkeys, HotkeyPressedDown
	
	Hotkey, %HotkeyColor%, GettingColor
	Hotkey, %HotkeyEnable%, EnableScript
	Hotkey, %HotkeyMenu%, OpenMenu
	menuOpenned:=0
return

ButtonExit:
	ExitApp
return

ButtonAddProfile:
	GuiControlGet, CurrentProfileName
	GuiControl,,CurrentProfileName, %CurrentProfileName%
	comboBoxList = %comboBoxList%|%CurrentProfileName%
	IniWrite, %comboBoxList%, main.ini, Menu, comboBoxList
	IniWrite, %CurrentProfileName%, profiles/%CurrentProfileName%.ini, Profile, ProfileName
	ProfileWriteClear(CurrentProfileName)
	GuiUpdate()
return

ButtonRemoveProfile:
	MsgBox 4, Проверка, Вы уверены?
	IfMsgBox Yes
	{
		GuiControlGet, CurrentProfileName
		NameField := SeekNameField()
		ComboBoxListLast := ComboBoxList
		StringReplace, ComboBoxListLast, ComboBoxList,|%NameField%,
		if(ComboBoxListLast==ComboBoxList){
			StringReplace, ComboBoxListLast, ComboBoxList,%NameField%|,
			if(ComboBoxListLast==ComboBoxList){
				StringReplace, ComboBoxListLast, ComboBoxList,%NameField%,
				if(ComboBoxListLast==ComboBoxList){
				}
			}
		}
		Control, Delete, %CurrentProfileName%,ComboBox1
		IniWrite, %comboBoxListLast%, main.ini, Menu, comboBoxList
		FileDelete, profiles/%NameField%.ini
		IniRead, comboBoxList, main.ini, Menu, comboBoxList
	}
return

ComboBoxChanged:
	NameField := SeekNameField()
	if(NameField!=""){
		GuiUpdate()
	}
return

SeekNameField()
{
	GuiControlGet, CurrentProfileName
	ControlGet, List, List, Selected, ComboBox1
	Loop, Parse, List, `n ; Строки разделены символом новой строки (`n).
	{	
		if(A_Index==CurrentProfileName)
		{
			return %A_LoopField%
		}
	}
}

GuiUpdate()
{
	NameField := SeekNameField()
	IniRead, flaskLifeActive1, profiles/%NameField%.ini, Flask, flaskLifeActive1
	IniRead, flaskLifeActive2, profiles/%NameField%.ini, Flask, flaskLifeActive2
	IniRead, esActive, profiles/%NameField%.ini, Flask, esActive
	IniRead, WarCryActive, profiles/%NameField%.ini, Flask, WarCryActive
	IniRead, flaskActive1, profiles/%NameField%.ini, Flask, flaskActive1
	IniRead, flaskActive2, profiles/%NameField%.ini, Flask, flaskActive2
	IniRead, flaskActive3, profiles/%NameField%.ini, Flask, flaskActive3
	IniRead, flaskActive4, profiles/%NameField%.ini, Flask, flaskActive4
	IniRead, flaskActive5, profiles/%NameField%.ini, Flask, flaskActive5
	IniRead, flaskActive5, profiles/%NameField%.ini, Flask, flaskActive5
	IniRead, PressedDown, profiles/%NameField%.ini, Flask, PressedDown
	
	IniRead, flaskLifeRegen1, profiles/%NameField%.ini, Properties, flaskLifeRegen1
	IniRead, playerHp, profiles/%NameField%.ini, Properties, playerHp
	IniRead, flaskUtil1y, profiles/%NameField%.ini, Properties, flaskUtil1y
	IniRead, flaskUtil2y, profiles/%NameField%.ini, Properties, flaskUtil2y
	IniRead, flaskUtil3y, profiles/%NameField%.ini, Properties, flaskUtil3y
	IniRead, flaskUtil4y, profiles/%NameField%.ini, Properties, flaskUtil4y
	IniRead, flaskUtil5y, profiles/%NameField%.ini, Properties, flaskUtil5y
	
	IniRead, TimerLifeInst, profiles/%NameField%.ini, Timers, TimerLifeInst
	IniRead, TimerLife35, profiles/%NameField%.ini, Timers, TimerLife35
	IniRead, TimerES, profiles/%NameField%.ini, Timers, TimerES
	IniRead, TimerUtil1, profiles/%NameField%.ini, Timers, TimerUtil1
	IniRead, TimerUtil2, profiles/%NameField%.ini, Timers, TimerUtil2
	IniRead, TimerUtil3, profiles/%NameField%.ini, Timers, TimerUtil3
	IniRead, TimerUtil4, profiles/%NameField%.ini, Timers, TimerUtil4
	IniRead, TimerUtil5, profiles/%NameField%.ini, Timers, TimerUtil5
	IniRead, TimerWarCry, profiles/%NameField%.ini, Timers, TimerWarCry
	IniRead, TimerInGameCheck, profiles/%NameField%.ini, Timers, TimerInGameCheck
	
	IniRead, HotkeyColor, main.ini, Hotkeys, HotkeyColor
	IniRead, HotkeyEnable, main.ini, Hotkeys, HotkeyEnable
	IniRead, HotkeyMenu, main.ini, Hotkeys, HotkeyMenu
	IniRead, HotkeyFlask1, main.ini, Hotkeys, HotkeyFlask1
	IniRead, HotkeyFlask2, main.ini, Hotkeys, HotkeyFlask2
	IniRead, HotkeyFlask3, main.ini, Hotkeys, HotkeyFlask3
	IniRead, HotkeyFlask4, main.ini, Hotkeys, HotkeyFlask4
	IniRead, HotkeyFlask5, main.ini, Hotkeys, HotkeyFlask5
	IniRead, HotkeyES, main.ini, Hotkeys, HotkeyES
	IniRead, HotkeyWarCry, main.ini, Hotkeys, HotkeyWarCry
	IniRead, HotkeyPressedDown, main.ini, Hotkeys, HotkeyPressedDown
	
	
	GuiControl ,, flaskLifeActive1, %flaskLifeActive1%
	GuiControl ,, flaskLifeActive2, %flaskLifeActive2%
	GuiControl ,, esActive, %esActive%
	GuiControl ,, WarCryActive, %WarCryActive%
	GuiControl ,, flaskActive1, %flaskActive1%
	GuiControl ,, flaskActive2, %flaskActive2%
	GuiControl ,, flaskActive3, %flaskActive3%
	GuiControl ,, flaskActive4, %flaskActive4%
	GuiControl ,, flaskActive5, %flaskActive5%
	GuiControl ,, PressedDown, %PressedDown%
	
	GuiControl ,, flaskLifeRegen1, %flaskLifeRegen1%
	GuiControl ,, playerHp, %playerHp%
	GuiControl ,, flaskUtil1y, %flaskUtil1y%
	GuiControl ,, flaskUtil2y, %flaskUtil2y%
	GuiControl ,, flaskUtil3y, %flaskUtil3y%
	GuiControl ,, flaskUtil4y, %flaskUtil4y%
	GuiControl ,, flaskUtil5y, %flaskUtil5y%
	
	GuiControl ,, TimerLifeInst, %TimerLifeInst%
	GuiControl ,, TimerLife35, %TimerLife35%
	GuiControl ,, TimerES, %TimerES%
	GuiControl ,, TimerUtil1, %TimerUtil1%
	GuiControl ,, TimerUtil2, %TimerUtil2%
	GuiControl ,, TimerUtil3, %TimerUtil3%
	GuiControl ,, TimerUtil4, %TimerUtil4%
	GuiControl ,, TimerUtil5, %TimerUtil5%
	GuiControl ,, TimerWarCry, %TimerWarCry%
	GuiControl ,, TimerInGameCheck, %TimerInGameCheck%
	
	GuiControl ,, HotkeyColor, %HotkeyColor%
	GuiControl ,, HotkeyEnable, %HotkeyEnable%
	GuiControl ,, HotkeyMenu, %HotkeyMenu%
	GuiControl ,, HotkeyFlask1, %HotkeyFlask1%
	GuiControl ,, HotkeyFlask2, %HotkeyFlask2%
	GuiControl ,, HotkeyFlask3, %HotkeyFlask3%
	GuiControl ,, HotkeyFlask4, %HotkeyFlask4%
	GuiControl ,, HotkeyFlask5, %HotkeyFlask5%
	GuiControl ,, HotkeyES, %HotkeyES%
	GuiControl ,, HotkeyWarCry, %HotkeyWarCry%
	GuiControl ,, HotkeyPressedDown, %HotkeyPressedDown%
	
	Hotkey, %HotkeyColor%, GettingColor
	Hotkey, %HotkeyEnable%, EnableScript
	Hotkey, %HotkeyMenu%, OpenMenu
}

ProfileWriteClear(Name)
{
	IniWrite, 0, profiles/%Name%.ini, Flask, flaskLifeActive1
	IniWrite, 0, profiles/%Name%.ini, Flask, flaskLifeActive2
	IniWrite, 0, profiles/%Name%.ini, Flask, esActive
	IniWrite, 0, profiles/%Name%.ini, Flask, WarCryActive
	IniWrite, 0, profiles/%Name%.ini, Flask, flaskActive1
	IniWrite, 0, profiles/%Name%.ini, Flask, flaskActive2
	IniWrite, 1, profiles/%Name%.ini, Flask, flaskActive3
	IniWrite, 1, profiles/%Name%.ini, Flask, flaskActive4
	IniWrite, 1, profiles/%Name%.ini, Flask, flaskActive5
	IniWrite, 0, profiles/%Name%.ini, Flask, PressedDown
	
	IniWrite, 979, profiles/%Name%.ini, Properties, flaskLifeRegen1
	IniWrite, 3000, profiles/%Name%.ini, Properties, playerHp
	IniWrite, 1013, profiles/%Name%.ini, Properties, flaskUtil1y
	IniWrite, 1013, profiles/%Name%.ini, Properties, flaskUtil2y
	IniWrite, 1013, profiles/%Name%.ini, Properties, flaskUtil3y
	IniWrite, 1013, profiles/%Name%.ini, Properties, flaskUtil4y
	IniWrite, 1013, profiles/%Name%.ini, Properties, flaskUtil5y
	
	IniWrite, 100, profiles/%Name%.ini, Timers, TimerLifeInst
	IniWrite, 49, profiles/%Name%.ini, Timers, TimerLife35
	IniWrite, 49, profiles/%Name%.ini, Timers, TimerES
	IniWrite, 500, profiles/%Name%.ini, Timers, TimerUtil1
	IniWrite, 500, profiles/%Name%.ini, Timers, TimerUtil2
	IniWrite, 500, profiles/%Name%.ini, Timers, TimerUtil3
	IniWrite, 500, profiles/%Name%.ini, Timers, TimerUtil4
	IniWrite, 500, profiles/%Name%.ini, Timers, TimerUtil5
	IniWrite, 4000, profiles/%Name%.ini, Timers, TimerWarCry
	IniWrite, 500, profiles/%Name%.ini, Timers, TimerInGameCheck
}