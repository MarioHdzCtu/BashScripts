#!/bin/bash
cd ~
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
config_file=~/.config/Code/User/settings.json
keys=$(jq '. | keys' $config_file)
if [ -z "$keys" ];
then
        echo "Config file empty... Creating new setting"
        echo '{}' | jq '.workbench.colorTheme = "Tokyo Night"' > $config_file
        echo "File updated"
elif [[ "${keys[@]}" =~ "workbench.colorTheme" || "${keys[@]}" =~ "workbench" ]];
then
        echo "Config already present... Updating value"
        jq '.workbench.colorTheme = "Tokyo Night"' $config_file > temp.json && mv temp.json $config_file
else
        echo "Config not found... Creating new config"
        jq '.workbench.colorTheme="Tokyo Night"' $config_file  > $config_file
        echo "File updated"
fi

