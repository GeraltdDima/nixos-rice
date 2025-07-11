import os

def run():
    powerDictionary = {
            "PowerOff": "systemctl poweroff",
            "Reboot": "systemctl reboot",
            "Logout": "loginctl terminate-user $USER"
    }

    choice = input()

    if not choice in powerDictionary:
        print("Invalid choice")
        return

    command = powerDictionary[choice]

    os.system(command)

if __name__ == "__main__":
    run()
