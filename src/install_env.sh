#########################
## change keybind of caps lock modifier -> control modifier, && caps lock -> escape
## https://gitlab.com/interception/linux/plugins/caps2esc
#########################
sudo add-apt-repository ppa:deafmute/interception
sudo apt install interception-tools
sudo apt install interception-caps2esc

#########################
## install chrome
#########################
# https://www.google.com/chrome/

#########################zsh
## install drop box
#########################
# https://www.dropbox.com/install-linux

#########################
## install one password
#########################
# https://app-updates.agilebits.com/product_history/CLI
# extract manually
sudo mv ~/Downloads/op /usr/local/bin
# https://support.1password.com/command-line/

#########################
## install ssh
#########################
sudo apt-get install ssh -y
# chmod 400 if needed

#########################
## install vim
#########################
sudo apt install vim

# use vim by default
echo "
# use vim by default in terminal
export VISUAL=vim
export EDITOR=\"$VISUAL\"
" >> ~/.zshrc

#########################
## install codium
#########################
# per https://vscodium.com/
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

# use microsoft extensions lib
➜ sudo find / -name product.json
...
/usr/share/codium/resources/app/product.json

vim /usr/share/codium/resources/app/product.json

#########################
## install zsh + oh-my-zsh + spaceship theme
#########################
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" && ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# reset from backup the zsh config
cp ~/git/more/dev-env-setup/bash_aliases.sh ~/.bash_aliases

# make sure we use zsh by default
echo "
exec zsh
" >> ~/.bashrc

# note: if git icon looks weird, make sure to install font that supports it: https://github.com/tonsky/FiraCode :
sudo apt install fonts-firacode

########################
## set git user
#######################
git config --global user.email "u...k...@gmail.com"
git config --global user.name "U... K..."
git config --global alias.lg "log --pretty=format:'%C(yellow)%h %Cred%ad %C(cyan)%an%Cgreen%d %Creset%s' --date=short"

#########################
## install node + npm + nvm
#########################
# install nvm per https://github.com/nvm-sh/nvm and follow latest and greatest instructs
nvm install lts/erbium # and install v12 lts

#########################
## show cpu usage in pop os bar
#########################
sudo apt install gnome-shell-extension-appindicator gnome-shell-extension-system-monitor
# login logout

#########################
## install aliases and profile defaults
#########################
cp ~/git/more/dev-env-setup/bash_aliases.sh ~/.bash_aliases

#########################
## install docker + docker compose
#########################
sudo apt install docker.io
sudo systemctl enable --now docker
sudo groupadd docker
sudo usermod -aG docker $USER # run w/o root attempt 1
sudo gpasswd -a $USER docker # run w/o root attempt 2
su - $USER # relogin
docker --version
docker run hello-world # check we can run without root
sudo apt install docker-compose

##########################
## install aws cli
##########################
sudo apt-get install awscli

# restore config into `~/.aws`
# example:
# [ahbode.prod]
# aws_access_key_id = __ID__
# aws_secret_access_key = __KEY__
# region=us-east-1

# # this should already be in zsh:
# # allow sdks to load the ~/.aws config (e.g., node.aws-sdk)
# echo "
# # allow aws-sdks to load config (e.g., node.aws-sdk grab region from ~/.aws)
# export AWS_SDK_LOAD_CONFIG=1
# " >> ~/.zshrc

# test installation
use.ahbode.dev # alias was defined by `./bash_aliases`
aws sts get-caller-identity

#########################
## install terraform w/ tfenv
#########################
git clone https://github.com/tfutils/tfenv.git ~/.tfenv

# add tfenv to $PATH
mkdir -p ~/.local/bin/
. ~/.profile
ln -s ~/.tfenv/bin/* ~/.local/bin
. ~/.profile

# and test install
which tfenv


#########################
## bump max files watched
##
## otherwise, we'll have errors watching files
#########################
# per https://stackoverflow.com/a/32600959/3068233
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

#########################
## vpn client (https://support.system76.com/articles/use-openvpn/)
#########################
sudo apt install openvpn network-manager-openvpn-gnome
