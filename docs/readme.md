# Wichtige AT-Commands

CUR -> not in flash  
DEF -> save in flash

Commands
* AT
* AT+CWMODE(_CUR/DEF) - set Mode
	* 1 Station
	* 2 AP
	* 3 Combo
	
* AT+CWLAP - List AP
* AT+CWLAPOPT=<sort><mask> - Configure CWLAP output
	* 1,14 -> mask for [ssid, rssi, mac]
	