   _____                 _     
  / ____|               | |    
 | (___   __ _ _ __   __| |___ 
  \___ \ / _` | '_ \ / _` / __|
  ____) | (_| | | | | (_| \__ \
 |_____/ \__,_|_| |_|\__,_|___/

Install dependencies:
https://github.com/Haivision/srt/blob/master/docs/build/build-linux.md
UBUNTU:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install tclsh pkg-config cmake libssl-dev build-essential

Building and Installing:
1. Make folder srt server
   ex : mkdir sands_srt_server

2. Build and install:
cd sands_srt_server
cd srt 
mkdir _build 
cd _build 
cmake .. 
make -j $(nproc) # Replace $(nproc) with the number of CPU cores for faster compilation 
sudo make install

3. Open Ports :  8181 & 8383 sebagai listener, 8282 & 8484 sebagai caller
ufw allow 8181/udp
ufw allow 8181/tcp
ufw allow 8282/udp
ufw allow 8282/tcp
ufw allow 8383/udp
ufw allow 8383/tcp
ufw allow 8484/udp
ufw allow 8484/tcp
ufw allow 22/tcp
ufw allow 22/udp

4. Multicast Server (Custom Haivision)
cd ..
cd srt-server-alatra
cmake .
make
sudo make install

5. Push RTMP to SRT via UDP with FFMPEG
Setup config ffmpeg in file script_ffmpeg.sh and script_ffmpeg_backup.sh

6. Automation
cd ..

#Adds execute permission FILE LISTENER SRT
chmod +x script_listener.sh
chmod +x script_listener_backup.sh

#Adds execute permission FILE LISTENER FFMPEG
chmod +x script_ffmpeg.sh
chmod +x script_ffmpeg_backup.sh

#LISTENER SRT in BACKGROUND
-Create Service  
cd /etc/systemd/system

nano srtserver.service
nano srtserver_backup.service
nano ffmpeg_srt.service
nano ffmpeg_srt_backup.service

sudo systemctl daemon-reload

sudo systemctl enable srtserver.service
sudo systemctl enable srtserver_backup.service
sudo systemctl enable ffmpeg_srt.service
sudo systemctl enable ffmpeg_srt_backup.service

sudo systemctl start srtserver.service
sudo systemctl start srtserver_backup.service
sudo systemctl start ffmpeg_srt.service
sudo systemctl start ffmpeg_srt_backup.service

#Log Archive Auto 
chmod +x archive_log_listener.sh

sudo crontab -e

# EVERY 1 MONTH, date 1
0 0 1 * * /var/www/srtsands/archive_log_listener.sh






