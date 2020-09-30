#!/bin/bash

#Baixa o apps.sh -- Download apps.sh

wget https://www.dropbox.com/s/02j2zmyhv7s8nwx/apps.sh

chmod +x apps.sh

##Atualizar repositorio -- Update the repository

apt-get update ;

##Instalar o Emby -- Install Emby Server

wget https://github.com/MediaBrowser/Emby.Releases/releases/download/4.5.1.0/emby-server-deb_4.5.1.0_amd64.deb
dpkg -i emby-server-deb_4.5.1.0_amd64.deb


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


## Instala o Transmission  -- Install Transmission

apt-get install transmission-daemon
service transmission-daemon stop

## Deleta config padrao do Transmission -- Delete default config of the transmission
rm /etc/transmission-daemon/settings.json

##Baixa A Config com senha padrao, que eu criei -- Download config with password default that I created
cd /etc/transmission-daemon/

wget https://www.dropbox.com/s/5ugendetp6oi8gh/settings.json

##Atualiza as config padrao do Transmission  -- Update default config of the transmission
cd
update-rc.d transmission-daemon defaults

## Incia o Serviço -- Start Service
service transmission-daemon start

## Adicione o repositório do Sonarr à sua fonte de software  -- Add the repository of the sonarr the software

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493
echo "deb http://apt.sonarr.tv/ master main" | sudo tee /etc/apt/sources.list.d/sonarr.list

apt update ;
apt install nzbdrone

## Inicia o Sonarr --- Start the Sonarr

mono --debug /opt/NzbDrone/NzbDrone.exe

./apps.sh