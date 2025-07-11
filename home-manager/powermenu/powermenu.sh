#!/bin/sh

cd ~/.config/home-manager/powermenu 
python3 ./list.py | wofi --dmenu | python3 ./powermenu.py
