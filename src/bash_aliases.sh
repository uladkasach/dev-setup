# open notes
alias notes='vim ~/git/Notes/main.txt'

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
alias use.ahbode.prod='export AWS_PROFILE=ahbode.prod'
alias use.whodis.prod='export AWS_PROFILE=whodis.prod'
alias use.alistokrad.prod='export AWS_PROFILE=alistokrad.prod'

# make sure caps acts like control
alias caps2control='setxkbmap -option "'"caps:ctrl_modifier"'"'

# make signing into onepass easier
alias op.signin='eval $(op signin my)'

# make it easier to open the browser
alias browser='google-chrome'
