UDPStartup()

For $i = 0 To 10 Step 1
   Local $iSocket = UDPOpen( "127.0.0.1", 50000 + $i*1000)
   UDPSend ( $iSocket, "a" )
   UDPCloseSocket($iSocket)
Next

