# PPPwn_OpenWrt
He añadido una interfaz web para arrancar PPPwn_cpp desde un teléfono solamente conectandote al router.
Descarga la ultima version [descargar pppwn_cpp repositorio oficial](https://nightly.link/xfangfang/PPPwn_cpp/workflows/ci.yaml/main).

## Requirements:

- Smart Router lan with OpenWrt.
- Have PuTTY installed on your PC to access the terminal.
- Download stage1.bin and stage2.bin from Sistro [repository](https://github.com/SiSTR0/PPPwn/releases) for the corresponding firmware.
- Download PPPwn_cpp for Linux distributions with MIPS chip or whichever your device has, verify with the command `uname -m`.
- Download goldhen.bin for you PS4 FW

## Steps installation:

1. Install unzip if it’s not already `opkg list-installed | grep unzip`, installed using the command
```sh
opkg update
opkg install unzip
```
2. From the terminal on your router, run the command
```sh
opkg update
opkg install unzip
cd 
wget https://github.com/CodeInvers3/PPPwn_ow/archive/refs/heads/main.zip
unzip main
chmod +x PPPwn_ow-main/install.sh
PPPwn_ow-main/install.sh
```
3. Verify which chip your router device has with `uname -m`. Based on that, choose which pppwn executable you need to download.
4. Look for the pppwn executable in the [official repository](https://nightly.link/xfangfang/PPPwn_cpp/workflows/ci.yaml/main)
5. Download the repository with the command `wget -O pppwn_file.zip url_of_your_pppwn`
6. Unzip the downloaded file with `unzip pppwn_file.zip` and then delete it with `rm pppwn_file.zip`
7. Extract the file with `tar -xzvf pppwn.tar.gz` and then delete it with `rm pppwn.tar.gz`
8. Finally, run the command `chmod +x pppwn` and `mv pppwn /usr/bin`
9. Copy goldhen.bin to your USB drive; it must be formatted in exFAT or FAT32.
10. Connect everything to the PS4 console and from the browser go to your router's IP address (http://192.168.1.1/pppwn.html)

Every time you turn on the router and connect the USB memory with goldhen.bin, the run.sh script will execute the pppwn command, which will allow the auto-exploit.

PPPwn from https://github.com/xfangfang/PPPwn_cpp

### Credits: Sistro / Xfangfang
