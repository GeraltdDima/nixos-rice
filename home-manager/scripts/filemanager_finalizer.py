import os

def run():
    imageViewer = 'loupe'
    textEditor = 'zeditor'
    browser = 'firefox'

    applicationDictionary = {
        ('.png', '.jpg', '.jpeg', '.svg'): imageViewer,
        ('.txt', '.cs', '.py', '.nix', '.js', '.ts'): textEditor,
        ('.html',): browser
    }

    file = input()
    ext = os.path.splitext(file)[1]

    for extensions, app in applicationDictionary.items():
        if ext in extensions:
            os.system(f"{app} {file}")
            return

    print("No associated application found.")

if __name__ == '__main__':
    run()

