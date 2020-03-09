# psss
PSSS WSN for C/C++ material

## Hardware
ESP-AT-Tutorial und anderes nützliches:
http://stefanfrings.de/esp8266/


ESP Adhoc   
https://www.researchgate.net/publication/323868854_An_Ad-Hoc_Network_based_on_Low_cost_Wi-Fi_Device_for_IoT_Device_Communication

Software: 
ESP8266_NONOS_SDK-3.0.1 (aber auch eigenes binary erstellt -> Complete_AT_Firmware.bin)
flash_download_tools_v3.6.7

## Routing
reaktiv - proaktiv  
Route suchen wenn Daten gesendet werden sollen - ständig aktuelle Tabelle behalten  
-> proaktiv wäre besser um Verbindungen zu visualisieren, weil Tabelle immer aktuell

Überlegung ob Master/Slave unterschieden werden sollen
ja:
* Master braucht komplette Routingtabelle
* Slave braucht nur 

AODV - Ad-hoc On-Demand Distance Vector  
* Nur Information über nächsten Nachbarn, der für Route zuständig ist -> "zu A geht es über B"
	* Geringerer Routenfindungsaufwand
		* Benötige Route -> Sende RREQ
		* Eingang RREQ -> Route vorhanden ? RREP : "smart Broadcast"
		* Eingang RREP -> Speichere Route
	* Master müsste alle Informationen von Hops Sammeln und selbst zusammenstellen
	

DSR 
* Komplette Routen speichern -> Komplette Routen senden in RREQ
* Höherer Aufwand bei Routenfindung, weil dynamische Pakete.

Beide reaktiv, sollten sich aber auch proaktiv machen lassen. 

OLSR
http://www.olsr.org/mediawiki/index.php/OLSR.org_Network_Framework   
V2: https://tools.ietf.org/html/rfc7181


