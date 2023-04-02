import subprocess

url = "https://mail.google.com/"
librewolf_path = "/usr/bin/librewolf"

subprocess.run([librewolf_path, url])
