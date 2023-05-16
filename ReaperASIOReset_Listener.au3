#include <WinAPISysWin.au3>

Opt("TrayIconHide", 1)

Func OnAutoItExit()
    UDPShutdown()
EndFunc

OnAutoItExitRegister("OnAutoItExit")


; wait till reaper is up
Local $hWnd = 0;
Do
   Sleep (500)
   $hWnd = WinGetHandle("[CLASS:REAPERwnd]")
Until $hWnd<>0

; Always want reaper at max priority
ProcessSetPriority ("reaper.exe", 5)

; This is what does the actual audio reset in reaper, send this to correct HWND and it resets
;_WinAPI_PostMessage($hWnd, 0x13D2, 0xAD001515, 0 )


UDPStartup()




Local $iListenSocket = 0;

For $i = 0 To 10 Step 1
   $iListenSocket =  UDPBind("127.0.0.1", 50000 + $i*1000)

   If @error Then
	  ; Someone is probably already listening on this IP Address and Port (script already running?).

	  if ($i == 10) Then
		  Local $iError = @error
		 MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Could not listen, Error code: " & $iError)
		 Exit
	  EndIf
   Else
	  ExitLoop;
   EndIf
Next

ConsoleWrite($i)


While true
   Local $sReceived = ""
   Do
	  Sleep(500)
	  $sReceived = UDPRecv($iListenSocket, 4)
   Until $sReceived <> ""
   _WinAPI_PostMessage($hWnd, 0x13D2, 0xAD001515, 0 )
WEnd