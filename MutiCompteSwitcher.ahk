SetTitleMatchMode, 2
global processus:="Dofus.exe"
global order:=true
global chars:=["Kawori","Kawoha","Kawopa","Kawopi"]

global windows:= []
global activeIndex:= 1

Tab::switch()
F1::activateAtIndex(1)
F2::activateAtIndex(2)
F3::activateAtIndex(3)
F4::activateAtIndex(4)
F5::activateAtIndex(5)
F6::activateAtIndex(6)
F7::activateAtIndex(7)
F8::activateAtIndex(8)




switch() {
    global windows, activeIndex


    InitWindows()
   

    index:= activeIndex + 1
    if(!index || index > windows.MaxIndex()) {
        index := 1
    }

    activateAtIndex(index)
}

activateAtIndex(index) {
    global windows, activeIndex

    InitWindows()

    hwnd := windows[index].hwnd
    WinActivate, ahk_class Shell_TrayWnd
    WinActivate, ahk_id %hwnd%

    if WinActive("ahk_id " hwnd) {
        activeIndex := index
    }
}

InitWindows() {
    global windows, activeIndex

    windows := getDofusWindows()

    if(order && windows.MaxIndex()) {
        windows := orderWindows(windows)
    }
}

orderWindows(wins) {
    global chars

    orderedWins := []
    
    i := 1
    Loop, % chars.MaxIndex() { 
        char := chars[i] 
        winFound := findFirstWindowByTitle(wins, char)
       
        if(winFound) {
            orderedWins.Push(winFound)
        }

        i++
    }

    return orderedWins
}

findFirstWindowByTitle(wins, searchText) {
    for _, win in wins {
        if (InStr(win.title, searchText)) {
            return win
        }
    }

    return ""
}

getDofusWindows() {
    global processus

    wins := []

    WinGet, idList, List, ahk_exe %processus%
    Loop, %idList%
    {
        hwnd := idList%A_Index%
        WinGetTitle, title, ahk_id %hwnd%
        wins.Push({ hwnd: hwnd, title: title })
    }
	
    return wins
}

Log(msg) {
    MsgBox, %msg%
}