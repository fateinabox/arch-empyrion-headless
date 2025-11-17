#!/bin/sh

mkdir /opt/steam

addgroup games
chgrp games steam
chmod g+rws steam

useradd -d /opt/steam steam
usermod -aG games steam

chown steam -R /opt/steam

pacman -Sy --noconfirm steamcmd

#install empyrion

mkdir /opt/empyrion
chown steam:games /opt/empyrion
chmod g+rws /opt/empyrion

sudo -u steam steamcmd +force_install_dir /opt/empyrion +@sSteamCmdForcePlatformType windows +login anonymous +app_update 530870 validate +quit

mkdir -p /opt/steam/.wine/dosdevices

ln -s /opt/empyrion /opt/steam/.wine/dosdevices/g:

su steam
cd ~
wineboot
exit



