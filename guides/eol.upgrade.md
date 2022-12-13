➜ do-release-upgrade
Checking for a new Ubuntu release
Your Ubuntu release is not supported anymore.
For upgrade information, please visit:
http://www.ubuntu.com/releaseendoflife

Please install all available updates for your release before upgrading.




--------

https://help.ubuntu.com/community/EOLUpgrades

# 1. upgrade sources.list

Update sources.list
To begin the upgrade, make sure you have a sources.list like the following, with CODENAME being your release, e.g. quantal. Do *not* change your CODENAME, though, just the domain name (to "old-releases.ubuntu.com").

```sh
## EOL upgrade sources.list
# Required
deb http://old-releases.ubuntu.com/ubuntu/ CODENAME main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ CODENAME-updates main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ CODENAME-security main restricted universe multiverse

# Optional
#deb http://old-releases.ubuntu.com/ubuntu/ CODENAME-backports main restricted universe multiverse
```


-----------

https://www.reddit.com/r/pop_os/comments/rrb9mz/sourceslist_file/



 Happiness Architect
cat /etc/apt/sources.list

26.7s  Wed 29 Dec 2021 08:33:57 AM MST
## This file is deprecated in Pop!_OS.
## See `man deb822` and /etc/apt/sources.list.d/system.sources.


---


~ at 16:22:32
➜ cat /etc/apt/sources.list.d/system.sources
X-Repolib-Name: Pop_OS System Sources
Enabled: yes
Types: deb deb-src
URIs: http://us.archive.ubuntu.com/ubuntu/
Suites: hirsute hirsute-security hirsute-updates hirsute-backports
Components: main restricted universe multiverse
X-Repolib-Default-Mirror: http://us.archive.ubuntu.com/ubuntu/


---

update it to

"/old-releases."


sudo cp /etc/apt/sources.list.d/system.sources /etc/apt/sources.list.d/system.sources.bak

sudo vim /etc/apt/sources.list.d/system.sources


now

```
➜ cat /etc/apt/sources.list.d/system.sources
X-Repolib-Name: Pop_OS System Sources
Enabled: yes
Types: deb deb-src
URIs: http://old-releases.ubuntu.com/ubuntu/
Suites: hirsute hirsute-security hirsute-updates hirsute-backports
Components: main restricted universe multiverse
X-Repolib-Default-Mirror: http://old-releases.ubuntu.com/ubuntu/
```
