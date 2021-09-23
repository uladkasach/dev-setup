#########################
## change keybind of caps lock modifier -> control modifier, && caps lock -> escape
#########################
sudo apt install xcape -y;
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"; # make caps work as ctrl; https://unix.stackexchange.com/a/66657/77522
grep -qxF 'xcape -e "'"Caps_Lock=Escape"'"' ~/.profile || echo '\n# map caps key to escape if pressed on its own\nxcape -e "'"Caps_Lock=Escape"'"' >> ~/.profile # writes to `~/.profile` if that line is not alrady there; Why add to `~/.profile` specifically?: https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980#183980

#########################
## make sure your pop-os laptop always starts in battery saver mode
#########################
grep -qxF 'system76-power profile battery' ~/.profile || echo '\n# start in battery saver\nsystem76-power profile battery' >> ~/.profile # writes to `~/.profile` if that line is not alrady there; Why add to `~/.profile` specifically?: https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile/183980#183980

#########################
## install chrome
#########################
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads;
sudo dpkg -i ~/Downloads/google-chrome-stable_current_amd64.deb;
google-chrome; # open it; set it as your defualt

#########################
## install ssh + generate ssh key for your machine
#########################
sudo apt-get install ssh -y;
ssh-keygen; # use the default path to save the key; create your own password
cat ~/.ssh/id_rsa.pub; # <- view your public key
# add it to your github account manually
google-chrome https://github.com/settings/keys

########################
## set git user
#######################
git config --global user.email "u...k...@gmail.com" # change me to your email
git config --global user.name "U... K..." # change me to your name
git config --global pull.ff only # make sure that pull only ever automatically fasts forward
git config --global init.defaultBranch main # default root branch name to `main`
git config --global alias.lg "log --pretty=format:'%C(yellow)%h %Cred%ad %C(cyan)%an%Cgreen%d %Creset%s' --date=short" # more concise alt to git log
git config --global alias.root 'rev-parse --show-toplevel' # e.g., `cd $(git root)`
git config --global alias.recommit 'commit --amend --no-edit' # e.g., to update the last commit in place
git config --global alias.shove 'push origin HEAD --force-with-lease' # e.g., git push current branches commits, as long as we have all the commits already too

########################
## clone this repo
#########################
mkdir -p ~/git/more;
git clone git@github.com:uladkasach/dev-env-setup.git ~/git/more/dev-env-setup;

#########################
## install zsh + oh-my-zsh + spaceship theme
#########################
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" && ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
cp ~/git/more/dev-env-setup/src/bash_aliases.sh ~/.bash_aliases # reset from backup the aliases config
cp ~/git/more/dev-env-setup/src/zshrc.sh ~/.zshrc # reset from backup the zsh config

# make sure we use zsh by default
echo "
exec zsh
" >> ~/.bashrc

# now open a new terminal

# note: if git icon looks weird, make sure to install font that supports it: https://github.com/tonsky/FiraCode :
sudo apt install fonts-firacode

#######################
## install bash alias dependencies
#######################
sudo apt install xclip -y # required for pbpaste, pbcopy

#########################
## install vim
#########################
sudo apt install vim -y # note: ~/.zshrc already defines that this is defaulta

#########################
## install neovim
#########################
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

#########################
## install codium
#########################
# per https://vscodium.com/
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y

# use microsoft extensions lib
# sudo find / -name product.json # reference for finding the full one
touch ~/.config/VSCodium/product.json;
echo "
{
  \"extensionsGallery\": {
    \"serviceUrl\": \"https://marketplace.visualstudio.com/_apis/public/gallery\",
    \"cacheUrl\": \"https://vscode.blob.core.windows.net/gallery/index\",
    \"itemUrl\": \"https://marketplace.visualstudio.com/items\",
    \"controlUrl\": \"\",
    \"recommendationsUrl\": \"\"
  }
}
" >> ~/.config/VSCodium/product.json;

#########################
## install node + npm + nvm
#########################
browser https://github.com/nvm-sh/nvm; # check if newer version avail; update the below version if it is
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash;
nvm install lts/erbium # and install v12 lts

#########################
## install drop box
#########################
google-chrome https://www.dropbox.com/install-linux # see what the latest version is; update the link below if its changed
wget https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb -P ~/Downloads;
sudo dpkg -i ~/Downloads/dropbox_2020.03.04_amd64.deb;
# now start dropbox manually; super + / "dropbox"; alt, try `dropbox start`?

#########################
## install one password (https://support.1password.com/command-line-getting-started/)
#########################
google-chrome https://app-updates.agilebits.com/product_history/CLI # <- check what the latest version is. we have it writen as 1.8.0 atm, but it will probably change by the time you use it. update your commands accordingly
wget https://cache.agilebits.com/dist/1P/op/pkg/v1.8.0/op_linux_386_v1.8.0.zip -P ~/Downloads;
unzip ~/Downloads/op_linux_386_v1.8.0.zip -d ~/Downloads/op_linux_386_v1.8.0;
gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22;
gpg --verify ~/Downloads/op_linux_386_v1.8.0/op.sig ~/Downloads/op_linux_386_v1.8.0/op;
sudo mv ~/Downloads/op_linux_386_v1.8.0/op /usr/local/bin;
op --version;

# signin
op signin my.1password.com wendy_appleseed@example.com; # swap with your email
op.signin; # use this bash alias to signin subsequently; it runs `eval $(op signin my)` for us

# see docs
google-chrome https://support.1password.com/command-line-getting-started/
google-chrome https://support.1password.com/command-line/
# for example, you can backup aws config with `op create document ~/.aws/credentials --title .aws/credentials`

##########################
## install aws cli
##########################
sudo apt-get install awscli -y;

# restore config into '~/.aws`
mkdir -p ~/.aws
op get document .aws/config --output ~/.aws/config
op get document .aws/credentials --output ~/.aws/credentials

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

#########################
## install psql
#########################
sudo apt-get install -y postgresql-client

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
sudo apt install openvpn network-manager-openvpn-gnome -y
# usage e.g.,:
#  mkdir -p ~/.vpn && op get document .vpn/main.connection.ovpn --output ~/.vpn/main.connection.ovpn
#  sudo openvpn --config ~/.vpn/main.connection.ovpn


########################
## add github cli tool
#######################
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

#######################
## add the other github cli tool 🙄
#######################
sudo apt install hub

#######################
## install ngrok
#######################
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -P ~/Downloads;
unzip ~/Downloads/ngrok-stable-linux-amd64.zip -d ~/Downloads/ngrok-stable-linux-amd64;
sudo mv ~/Downloads/ngrok-stable-linux-amd64/ngrok /usr/bin/ngrok
ngrok authtoken __from_you_account_settings__
ngrok help

#######################
## install gnome extensions: https://support.system76.com/articles/customize-gnome
#######################
sudo apt install -y gnome-shell-extension-appindicator gnome-shell-extension-system-monitor  # show cpu usage in pop os bar
sudo apt install -y gnome-shell-pomodoro # show pomodoro extensinon
sudo apt install -y gnome-shell-extension-remove-dropdown-arrows # until gnome 40, remove the ugly arrows on app indicators: https://github.com/mpdeimos/gnome-shell-remove-dropdown-arrows
sudo apt install -y gir1.2-gst-plugins-base-1.0 && echo 'install the radio extension through website for now...' && browser https://github.com/hslbck/gnome-shell-extension-radio
logout # login logout of DE
# then search "extensions" in settings and turn them on manually

#######################
## install support for AAC+ audio format codec (for comedy-radio.ru stream)
#######################
# comedy-radio.ru : https://pub0101.101.ru:8000/stream/air/aac/64/202
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install libavcodec58 ffmpeg

#######################
## make sure that nightlight is enabled
#######################
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true ## https://askubuntu.com/questions/1246195/how-to-turn-on-night-light-blue-light-filter-in-ubuntu-20-04

#######################
## decrease mtu to make more reliable on poorer networks
#######################
sudo ifconfig wlp113s0 mtu 1400 # https://serverfault.com/a/670081/276221 (https://www.cloudflare.com/learning/network-layer/what-is-mtu/)
