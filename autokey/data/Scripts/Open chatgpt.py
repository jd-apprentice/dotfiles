import subprocess

url = "https://chat.openai.com/chat"
librewolf_path = "/usr/bin/librewolf"

subprocess.run([librewolf_path, url])