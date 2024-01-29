#!/bin/bash
cd ~
sudo apt update && sudo apt upgrade -y
#Install Git
echo "Installing git"
sudo apt install git -y
#Install ssh
echo "Installing ssh"
sudo apt install ssh -y
#Install VS Code
echo "Installing VS Code"
sudo apt install software-properties-common-apt-transport-https wget -
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code
#VSCODE extensions installation
echo "Installing VS Code extensions"
sudo apt install jq
code --install-extension enkia.tokyo-night
code --install-extension ms-python.python
code --install-extension ms-python.isort
code --install-extension python.vscode-pylance
code --install-extension njpwerner.autodocstring
code --install-extension team.vscode-icons

#VSCODE Theme setter
echo "Setting VSCode Theme"
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

