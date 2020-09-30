#!/bin/bash

##Atualizar repositorio  --- Update the repository 

apt-get update ;

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

echo -e '\033[01;32m Transmission: https://IP:8989 \033[00;37m'
echo -e '\033[01;32m user: 12345  password: 12345 \033[00;37m'
echo -e '\033[01;32m Script Created By MrMoreira \033[00;37m'