#!/bin/bash

if [ ! -f /usr/bin/asClean.sh ]; then

    cp -rv ./ /tmp/asClean
    pkexec bash /tmp/asClean/dependencies.sh
    rm -rfv /tmp/asClean
else
    zenity cclean="/usr/share/pixmaps/asClean/ccleaner.png" --question --text="Удалить с ПК ?" --height=100 --width=300

        if [ $? = 0 ]; then

        appdel=$(zenity --window-icon="/usr/share/pixmaps/asClean/ccleaner.png" --list --column="Удалить"\
        --separator=" " --multiple --title="UnAsClean" --text="Выберите программы для удаления: ctrl+ " \
        "bleachbit" "sweeper" "lm-sensors" "zenity" "gamemode" --height=300)

        touch /tmp/appdel
        echo $appdel >> /tmp/appdel


        pkexec bash /etc/init.d/UnAsClean

        rm -v /tmp/appdel 
        fi
fi   


exit 0;


