#!/bin/bash

##Atualizar repositorio -- Update the repository

apt-get update ;

##Dependecias Do Raddar -- Dependencies of the radarr

echo -e '\033[01;32mRadarr dependencies\033[00;37m'

apt update && sudo apt install libmono-cil-dev curl mediainfo -y

##Baixa a  ultima versao mais recente do Radarr para Ubuntu -- Download the latest version on the radarr for ubuntu

echo -e '\033[01;32mDownload da ultima versao do Radarr para Ubuntu\033[00;37m'

curl -L -O $( curl -s https://api.github.com/repos/Radarr/Radarr/releases | grep linux.tar.gz | grep browser_download_url | head -1 | cut -d \" -f 4 )

tar -xvzf Radarr.develop.*.linux.tar.gz

## Movendo para outro diretorio -- Move for other directory
mv Radarr /opt

cd /etc/systemd/system/

wget https://dl.dropbox.com/s/7tm0kyakccz7r52/radarr.service

cd

systemctl enable radarr
service radarr start


echo -e '\033[01;32m Radarr: https://IP:7878 \033[00;37m'
echo -e '\033[01;32m Script Created By MrMoreira \033[00;37m'