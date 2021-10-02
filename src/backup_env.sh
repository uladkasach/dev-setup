DATESTAMP=$(date "+%Y.%m.%d");
echo $DATESTAMP;

# backup aws config
op create document ~/.aws/credentials --title .aws/credentials.$DATESTAMP; # save the historic version of the credentials permanently, so we can revert in the future if needed
op edit document .aws/credentials ~/.aws/credentials; # save the "current" version of the credentials, for active usage

# backup vpm connection files
op create document ~/.vpn/ahbode.dev.vpn.main.connection.ovpn --title .vpn/ahbode.dev.vpn.main.connection.ovpn;
op create document ~/.vpn/ahbode.prod.vpn.main.connection.ovpn --title .vpn/ahbode.prod.vpn.main.connection.ovpn;

# backup our gnome radio channel list
op create document ~/.gse-radio/channelList.json --title .gse-radio/channelList.json
