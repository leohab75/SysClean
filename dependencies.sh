#!/bin/bash

#установка программ

apt update
apt install aptitude sweeper xterm lm-sensors zenity gamemode bleachbit -y


#определение оборудования
yes | sensors-detect

#управление утилитой
cp /tmp/SysClean/SysClean /usr/bin/

#удаление утилиты
cp /tmp/SysClean/UnSysClean /etc/init.d/

#чистка от рута
cp /tmp/SysClean/SysCleanRoot /etc/init.d/

#иконки
mkdir /usr/share/pixmaps/SysClean
cp -rv /tmp/SysClean/ico/* /usr/share/pixmaps/SysClean/
cp /tmp/SysClean/SysClean.desktop /usr/share/applications/

#обновление меню приложений
update-desktop-database
update-icon-caches /usr/share/pixmaps/*

#инициализация файлов
chmod +x /usr/bin/SysClean
chmod +x /etc/init.d/SysCleanRoot
chmod +x /etc/init.d/UnSysClean
chmod +x /usr/share/applications/SysClean.desktop

exit 0
