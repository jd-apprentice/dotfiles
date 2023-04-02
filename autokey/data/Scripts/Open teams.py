import subprocess

url = "https://teams.microsoft.com/"
librewolf_path = "/usr/bin/librewolf"

subprocess.run([librewolf_path, url])

