import subprocess

url = "https://app.slack.com/client/T0168FKAXFC/C0161PEQ8CE"
librewolf_path = "/usr/bin/librewolf"

subprocess.run([librewolf_path, url])
