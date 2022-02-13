#include <WinAPISysWin.au3>

Opt("TrayIconHide", 1)


Func OnAutoItExit()
    TCPShutdown()
EndFunc

OnAutoItExitRegister("OnAutoItExit")



Local $hWnd = WinGetHandle("[CLASS:REAPERwnd]")

; This is what does the actual audio reset in reaper, send this to correct HWND and it resets
;_WinAPI_PostMessage($hWnd, 0x13D2, 0xAD001515, 0 )


UDPStartup()
Local $iListenSocket = UDPBind("127.0.0.1", 65432)

If @error Then
   ; Someone is probably already listening on this IP Address and Port (script already running?).
   Local $iError = @error
   MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Could not listen, Error code: " & $iError)
   Return False
EndIf

While true
   Local $sReceived = ""
   Do
	  Sleep(500)
	  $sReceived = UDPRecv($iListenSocket, 4)
   Until $sReceived <> ""
   _WinAPI_PostMessage($hWnd, 0x13D2, 0xAD001515, 0 )
WEnd












