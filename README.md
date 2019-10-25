# psss
PSSS WSN for C/C++ material

## Hardware

https://www.amazon.de/ESP-07-WLAN-Modul-ESP8266-Keramikantenne-Arduino/dp/B01HQR9T9M

http://stefanfrings.de/esp8266/

ESP Adhoc   
https://www.researchgate.net/publication/323868854_An_Ad-Hoc_Network_based_on_Low_cost_Wi-Fi_Device_for_IoT_Device_Communication

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