UDPStartup()
Local $iSocket = UDPOpen( "127.0.0.1", 65432)
UDPSend ( $iSocket, "a" )
UDPCloseSocket($iSocket)









