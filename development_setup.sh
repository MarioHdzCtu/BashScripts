#!/bin/bash
sudo apt update && sudo apt upgrade -y
#Install Git
sudo apt install git -y
#Install ssh
sudo apt install ssh -y
#Install VS Code
sudo apt install software-properties-common-apt-transport-https wget -
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
#VSCODE customization
sudo apt install jq
code --install-extension enkia.tokyo-night

filename="$HOME/.config/Code/User/settings.json"
new_value="Tokyo Night"

jq --arg new_value "$new_value" '.workbench.colorTheme |= $new_value' "$filenam>
mv "$filename.tmp" "$filename"
