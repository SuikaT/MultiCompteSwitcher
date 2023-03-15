SetTitleMatchMode, 2

global Char1:="Kawibou"
global Char2:="Kawypso"
global Char3:="Kawapace"
global Char4:="Kawopa"
global Char5:="Kawoha"
global Char6:="Kawortie"
global Char7:="Kawoxine"
global Char8:="Kawoya"
global totalChar:=8

loop
{
	Tab::switch()
    XButton2::switch()
	XButton1::switchBack()	
    F1::activateCharAtPosition(1)
	F2::activateCharAtPosition(2)
	F3::activateCharAtPosition(3)
	F4::activateCharAtPosition(4)
 	F5::activateCharAtPosition(5)
	F6::activateCharAtPosition(6)
	F7::activateCharAtPosition(7)
	F8::activateCharAtPosition(8)

	F12::ExitApp
	
	return	
}



switch(){

    if(!WinActive("Dofus"))
	{
	   return
	}

	i:=1
	loop
	{				
		if(i > totalChar){
			subswitch(0)
			break
		}
		charToCheck:= Char%i%
		IfWinActive,%charToCheck% 
		{
			subswitch(i)
			break
		}
		

		i++
	}
	
	
	return
}

subswitch(i)
{
	loop
	{	
		i++ 
	    if(i > totalChar){
			subswitch(0)
			break
		}
		
		currentChar:= Char%i%
		IfWinExist,%currentChar%
		{
			WinActivate,%currentChar%
			break
		}			   
	}
	
	return
}

switchBack(){
    if(!WinActive("Dofus"))
	{
	   return
	}

	i:= totalChar
	loop
	{				
		if(i <= 0){
			subswitchBack(0)
			break
		}
		charToCheck:= Char%i%
		IfWinActive,%charToCheck% 
		{
			subswitchBack(i)
			break
		}
		

		i--
	}
	
	
	return
}

subSwitchBack(i)
{
	loop
	{	
		i--
	    if(i <= 0){
			subswitchBack(totalChar)
			break
		}
		
		currentChar:= Char%i%
		IfWinExist,%currentChar%
		{
			WinActivate,%currentChar%
			break
		}			   
	}
	
	return
}


;;Activate the windows at the given position but the real position. For example, if char1, 2 and 4 are connected then the char4 is at 3rd position
activateCharAtPosition(i)
{  
    if(!WinActive("Dofus"))
	{
	   return
	}

	actualPosition:=0 
	index:=0
	Loop
	{
		index++ 
		if(index > totalChar){
			subswitch(0)
			break
		}
		currentChar:= Char%index%
		ifWinExist,%currentChar%
		{
			actualPosition++
			if(actualPosition = i){
				WinActivate,%currentChar%
				break
			}

		}
	}
	return
}

