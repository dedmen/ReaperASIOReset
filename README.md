# ReaperASIOReset

This is a simple [AutoIt3](https://www.autoitscript.com/site/) script that sends a ASIO Reset to [Reaper](https://www.reaper.fm/Reaper)

The actual code needed to do it is
`PostMessage($hWnd, 0x13D2, 0xAD001515, 0 )`
Just send this message to Reapers main window and it will reset
