#!/bin/bash

## Adicione o repositório do Sonarr à sua fonte de software  -- Add the repository of the sonarr the software

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493
echo "deb http://apt.sonarr.tv/ master main" | sudo tee /etc/apt/sources.list.d/sonarr.list

apt update ;
apt install nzbdrone

## Inicia o Sonarr --- Start the Sonarr

mono --debug /opt/NzbDrone/NzbDrone.exe

echo -e '\033[01;32m Sonarr: https://IP:8989 \033[00;37m'

echo -e '\033[01;32m Script Created By MrMoreira \033[00;37m'