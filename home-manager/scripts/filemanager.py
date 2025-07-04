import subprocess
import os

def open_wofi(current_path):
    try:
        entries = os.listdir(current_path)
    except FileNotFoundError:
        return None

    wofi_input = '\n'.join(entries).encode()
    try:
        output = subprocess.check_output(
            ['wofi', '--dmenu'],
            input=wofi_input
        ).decode().strip()
    except subprocess.CalledProcessError:
        return None

    return output

def run():
    current_path = os.path.expanduser('~')

    while True:
        result = open_wofi(current_path)

        if result is None:
            print("Wofi canceled or error occurred.")
            break

        next_path = os.path.join(current_path, result)

        if os.path.isdir(next_path):
            current_path = next_path
        else:
            print(next_path)
            break

if __name__ == '__main__':
    run()

