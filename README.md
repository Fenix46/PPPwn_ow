# PPPwn_OpenWrt
Ecco l'expolit testato su modem Technicolor DGA4132 rootato e perfettamente funzionante. Devo Ringraziare @CodeInvers3 per l'idea, ed anche @harsha-0110 per il loader pppwn per CPU ARM V7l. Inizialmente ho testato il lavoro di @CodeInvers3, dove in teoria c'è anche una pagina web che viene hostata dal modem, ma sul DGA4132 non funziona, ne seguiranno ulteriori test. Ovviamente lascio anche i riferimenti per il download dei pppwn loader per varie piattaforme diverse. [descargar pppwn_cpp repositorio oficial](https://nightly.link/xfangfang/PPPwn_cpp/workflows/ci.yaml/main).

## TEST Effettuato:

root@modemtim:~# ./run.sh
[+] PPPwn++ - PlayStation 4 PPPoE RCE by theflow
[+] args: interface=br-lan fw=900 stage1=/root/offsets/stage1_900.bin stage2=/root/offsets/stage2_900.bin auto-retry=on

[+] STAGE 0: Initialization
[*] Waiting for PADI...
[*] Waiting for PADI...
[+] pppoe_softc: 0xffffd78f4c6b5e00
[+] Target MAC: 2c:cc:44:6b:91:bd
[+] Source MAC: 07:5e:6b:4c:8f:d7
[+] AC cookie length: 4e0
[*] Sending PADO...
[*] Waiting for PADR...
[*] Sending PADS...
[*] Sending LCP configure request...
[*] Waiting for LCP configure ACK...
[*] Waiting for LCP configure request...
[*] Sending LCP configure ACK...
[*] Sending IPCP configure request...
[*] Waiting for IPCP configure ACK...
[*] Waiting for IPCP configure request...
[*] Sending IPCP configure NAK...
[*] Waiting for IPCP configure request...
[*] Sending IPCP configure ACK...
[*] Waiting for interface to be ready...
[+] Target IPv6: fe80::2ecc:44ff:fe6b:91bd
[+] Heap grooming...done

[+] STAGE 1: Memory corruption
[+] Pinning to CPU 0...done
[*] Sending malicious LCP configure request...
[*] Waiting for LCP configure reject...
[*] Sending LCP configure request...
[*] Waiting for LCP configure ACK...
[*] Waiting for LCP configure request...
[*] Sending LCP configure ACK...
[*] Sending IPCP configure request...
[*] Waiting for IPCP configure ACK...
[*] Waiting for IPCP configure request...
[*] Sending IPCP configure NAK...
[*] Waiting for IPCP configure request...
[*] Sending IPCP configure ACK...
[+] Scanning for corrupted object...found fe80::006c:4141:4141:4141

[+] STAGE 2: KASLR defeat

[*] Defeating KASLR...
[+] pppoe_softc_list: 0xffffffff856a59f8
[+] kaslr_offset: 0x12b8000

[+] STAGE 3: Remote code execution
[*] Sending LCP terminate request...
[*] Waiting for PADI...
[+] pppoe_softc: 0xffffd78f4c6b5e00
[+] Target MAC: 2c:cc:44:6b:91:bd
[+] Source MAC: 03:e6:c4:83:ff:ff
[+] AC cookie length: 510
[*] Sending PADO...
[*] Waiting for PADR...
[*] Sending PADS...
[*] Triggering code execution...
[*] Waiting for stage1 to resume...
[*] Sending PADT...
[*] Waiting for PADI...
[+] pppoe_softc: 0xffffd78f4c908200
[+] Target MAC: 2c:cc:44:6b:91:bd
[+] AC cookie length: 0
[*] Sending PADO...
[*] Waiting for PADR...
[*] Sending PADS...
[*] Sending LCP configure request...
[*] Waiting for LCP configure ACK...
[*] Waiting for LCP configure request...
[*] Sending LCP configure ACK...
[*] Sending IPCP configure request...
[*] Waiting for IPCP configure ACK...
[*] Waiting for IPCP configure request...
[*] Sending IPCP configure NAK...
[*] Waiting for IPCP configure request...
[*] Sending IPCP configure ACK...

[+] STAGE 4: Arbitrary payload execution
[*] Sending stage2 payload...
[+] Done!
root@modemtim:~#

## Requisiti:

- Technicolor DGA4132 rootato.
- Putty.
- Stage1.bin e Stage2.bin sono già al'interno della cartella offsets ma lascio il riferimento del grande @Sistro [repository](https://github.com/SiSTR0/PPPwn/releases).
- Il loader pppwn è anch'esso presente sul repo.
- Download goldhen.bin compatibile con la vostra PS4

## Installazione:

1. Installate "unzip" se non l'avete fatto. Per capire se è già presente lanciate questo comando `opkg list-installed | grep unzip`.
```sh
opkg update
opkg install unzip
```
2. Dopo aver installato unzip lanciate questi comandi da terminale
```sh
cd
```
3. Dovreste vedere sul terminale questo
```sh
"root@modemtim:~#"
```
4. Mi raccomanto di stare attenti a questo segno "~#" e non dovete trovarvi così "/#"
Continuate con:
```sh
wget https://github.com/Fenix46/pppwn_owt/archive/refs/heads/main.zip
unzip main
chmod +x pppwn_owt-main/install.sh
pppwn_owt-main/install.sh
```
5. Date questo comando
```sh
ls -l
```
6. Se tutto va a buon fine dovreste vedere il seguente input dal terminale
```sh
drwxr-xr-x    2 root     root             0 May 24 15:44 offsets
-rwxr-xr-x    1 root     root           138 May 31 12:53 run.sh
```
7. Collegate la PS4 al modem e fate la classica config per il PPPoE per l'exploit non lanciate la verifica della connessione, andrà fatto dopo che sarete al punto 9.
8. Inserite la penna UsB con il goldhen.bin nella PS4
9. E lanciate questo comando
```sh
./run.sh
```
10. Vedrete da terminale l'exploit partire. La config ha l'auto restart se l'exploit fallisce. 

La configurazione è stata testata su PS4 fw 9.00 già exploitata con pppwn ma da pc, quindi il goldhen era già presente su HDD e non ho usato chiavetta a dimostrare il fatto che funziona anche dopo.

L'exploit si può lanciare tutte le volte che si vuole perchè è dormiente e non necessità come in altre config del modem che venga riavviato, basta entrare in "SSH" sul modem e lanciare ./run.sh ovviamente con PS4 collegata già pronta per essere exploitata.

PPPwn from https://https://github.com/harsha-0110/PPPWN-JIO-Router

### A big Thanks is for: @TheOfficialFloW @Sistro @Xfangfang @CodeInvers3 @harsha-0110
