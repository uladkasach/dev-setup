# open notes
alias notes='vim ~/git/notes/main.txt'

# copy paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# copy uuid into clipboard
alias getuuid='uuidgen | tr -d "'"\n"'" | pbcopy && echo "'"  ✔ uuid was copied"'"'

# quick test alias
alias ju='npx jest -c jest.unit.config.js'
alias ji='npx jest -c jest.integration.config.js'
alias ja='npx jest -c jest.acceptance.config.js'
alias jal='LOCALLY=true ja'

# aws profiles
alias use.tugether='export AWS_PROFILE=tugether'
alias use.ahbode.dev='export AWS_PROFILE=ahbode.dev'
alias use.ahbode.prod='export AWS_PROFILE=ahbode.prod'
alias use.whodis.prod='export AWS_PROFILE=whodis.prod'
alias use.alistokrad.prod='export AWS_PROFILE=alistokrad.prod'

# github token
alias use.github.admin='export GITHUB_TOKEN=$(op get item github.admin.pat | jq -r .details.password)'

# terraform caching, for when on slow internet
alias use.terraform.caching='mkdir -p $HOME/.terraform.d/plugin-cache && export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"' # https://www.terraform.io/docs/cli/config/config-file.html#provider-plugin-cache

# make it easy to manually update the keymappings, in case they drop off for some reason
alias kmap.caps2ctrl='setxkbmap -option "'"caps:ctrl_modifier"'"'
alias kmap.caps2esc='xcape -e "'"Caps_Lock=Escape"'" &'

# make signing into onepass easier
alias op.signin='eval $(op signin my)'

# make it easier to open the browser
alias browser='google-chrome'

# make it easy to speed test internet connection
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'

# make it easy to change brightness beyond default brightness range
alias brightness='xrandr --output eDP-1 --brightness'

# make it easy to restart utils
alias restart.bluetooth='sudo systemctl restart bluetooth'
alias restart.wifi='sudo systemctl restart NetworkManager.service'

# make it easy to update bashalias
alias devenv.sync.bashalias='cp ~/git/more/dev-env-setup/src/bash_aliases.sh ~/.bash_aliases'

# make it easy to suspend and restart and shutdown
alias power.suspend='systemctl suspend' # todo, swap to `suspend-then-hibernate` when supported
alias power.off='shutdown -h now '
alias power.restart='reboot'

# make it easy to work with bluetooth devices
alias bluetooth.devices='bluetoothctl devices';
alias bluetooth.connect='bluetoothctl connect';
alias bluetooth.disconnect='bluetoothctl disconnect';

# make it easy to adjust brightness
alias keyboard.backlight.off='sudo tee /sys/class/leds/dell::kbd_backlight/brightness <<< 0'
alias keyboard.backlight.dim='sudo tee /sys/class/leds/dell::kbd_backlight/brightness <<< 1'
alias keyboard.backlight.bright='sudo tee /sys/class/leds/dell::kbd_backlight/brightness <<< 2'

# make it easy to fetch the weather
alias weather.in.here='curl wttr.in'
alias weather.in.indianapolis='curl wttr.in/Indianapolis'
