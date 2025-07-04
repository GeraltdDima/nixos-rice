#!/usr/bin/env python3
import subprocess
import re

layout_map = {
    'English (US)': 'EN',
    'Russian': 'RU',
    'Hebrew': 'HE',
}

def get_main_keyboard_layout():
    try:
        output = subprocess.check_output(['hyprctl', 'devices']).decode()
        keyboards = output.split("Keyboard at")

        for kb in keyboards:
            if "main: yes" in kb:
                match = re.search(r'active keymap:\s*(.+)', kb)
                if match:
                    layout_name = match.group(1).strip()
                    return layout_map.get(layout_name, layout_name)
        return "??"
    except Exception as e:
        return "ERR"

if __name__ == "__main__":
      print(get_main_keyboard_layout())

