import subprocess

url = "https://app.slack.com/client/TF4QM236W/CF670NNG6"
librewolf_path = "/usr/bin/librewolf"

subprocess.run([librewolf_path, url])
