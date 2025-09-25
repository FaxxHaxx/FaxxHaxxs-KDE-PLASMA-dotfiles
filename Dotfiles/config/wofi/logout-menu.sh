#!/bin/bash

# Simple logout menu for KDE Plasma 6 by faxxhaxx
# Uses wofi for the menu interface

action=$(echo -e "Lock\nLogout\nReboot\nShutdown\nSuspend\nHibernate" | wofi --dmenu --prompt "Select action:")

case "$action" in
    "Lock")
        qdbus6 org.freedesktop.ScreenSaver /ScreenSaver Lock
        ;;
    "Logout")
        qdbus6 org.kde.Shutdown /Shutdown logout
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
    *)
        exit 0
        ;;
esac
