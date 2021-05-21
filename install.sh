#!/bin/bash

#если установлен, перходим к удалению
if [[ ! -f /usr/bin/SysClean ]]; then

    #установка
    cp -rv ./ /tmp/SysClean
    pkexec bash /tmp/SysClean/dependencies.sh
    rm -rfv /tmp/SysClean

else

    cclean="/usr/share/pixmaps/SysClean/ccleaner.png"

    zenity --window-icon=$cclean --question --text="Удалить с ПК ?" --height=100 --width=300

    if [[ $? == 0 ]]; then

        appdel=$(zenity --window-icon=$cclean --list --column="Удалить" \
            --separator=" " --multiple --title="Delete programm" --text="Выберите программы для удаления: ctrl+ " \
            "bleachbit" "sweeper" "lm-sensors" "zenity" "gamemode" "wget" "xterm" --height=300)

        touch /tmp/appdel
        echo $appdel >>/tmp/appdel

        rm -fv /home/$USER/.local/share/applications/SysClean.desktop

        #запуск скрипта удаления утилиты
        pkexec bash /etc/init.d/UnSysClean

        rm -v /tmp/appdel
    fi
fi

exit 0
