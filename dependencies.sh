#!/bin/bash

apt update
apt install bleachbit aptitude sweeper lm-sensors zenity gamemode -y 

yes | sensors-detect

#управление утилитой
cp /tmp/SysClean/SysClean /usr/bin/

#удаление
cp /tmp/SysClean/UnSysClean /etc/init.d/


#чистка от рута
cp /tmp/SysClean/SysCleanRoot /etc/init.d/


#иконки
mkdir /usr/share/pixmaps/SysClean
cp -rv /tmp/SysClean/ico/* /usr/share/pixmaps/SysClean/
cp /tmp/SysClean/SysClean.desktop /usr/share/applications/

update-desktop-database
update-icon-caches /usr/share/pixmaps/*

chmod +x /usr/bin/SysClean
chmod +x /etc/init.d/SysCleanRoot
chmod +x /etc/init.d/UnSysClean
chmod +x /usr/share/applications/SysClean.desktop



exit 0;
