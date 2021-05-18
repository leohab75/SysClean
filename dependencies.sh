#!/bin/bash

apt update
apt install bleachbit aptitude sweeper lm-sensors zenity gamemode -y 

yes | sensors-detect

#управление утилитой
cp /tmp/asClean/asClean.sh /usr/bin/

#удаление
cp /tmp/asClean/UnAsClean /etc/init.d/


#чистка от рута
cp /tmp/asClean/AsClean /etc/init.d/


#иконки
mkdir /usr/share/pixmaps/asClean
cp -rv /tmp/asClean/ico/* /usr/share/pixmaps/asClean/
cp /tmp/asClean/asClean.desktop /usr/share/applications/

update-desktop-database
update-icon-caches /usr/share/pixmaps/*

chmod +x /usr/bin/asClean.sh
chmod +x /etc/init.d/AsClean
chmod +x /etc/init.d/UnAsClean
chmod +x /usr/share/applications/asClean.desktop



exit 0;
