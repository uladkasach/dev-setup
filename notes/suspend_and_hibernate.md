# hibernate vs suspend

both hibernate and suspend are attempts at letting a user pause their activity on their computer, without loosing state, while maximizing energy consumption

suspend can be handled in multiple ways:
- save state to ram, for very high energy savings (deep)
- keep state running but shutoff main processes, for reasonable energy savings (s2idle)

hibernate is the process of saving state to disk and rebooting from that, and is the most energy efficient solution

to maximize energy efficiency, `suspend-then-hibernate` is the recommended approach

# hibernation

hibernation may need to be installed on your particular computer.

not all cpu's are supported for hibernation. you must see if yours is

in progress installation steps

```sh

#######################
## setup your computer to suspend-then-hibernate; hibernate uses no power to reboot state
## refs:
## - https://askubuntu.com/questions/1048159/does-linux-have-a-hybrid-deep-sleep-mode-like-the-mac
## - https://askubuntu.com/questions/145443/how-do-i-use-pm-suspend-hybrid-by-default-instead-of-pm-suspend/781957#781957
## - https://askubuntu.com/questions/1115572/ubuntu-18-04-dell-xps15-9570-impossible-to-reliably-suspend-hibernate
## - https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Instantaneous_wakeups_from_suspend
## - https://askubuntu.com/questions/1240123/how-to-enable-hibernate-option-in-ubuntu-20-04
#######################
# make sure that the size of your swap is at least as big as your memory
swapon --show

# if it is, grab the uuid of the swap partition
grep swap /etc/fstab

# TODO: https://askubuntu.com/a/1241902/357970


# test that hibernate now works on this system
sudo systemctl hibernate # if it wakes up immediately, it does not work

## ONLY if hibernate works, do the following

# configure suspend-then-hibernate settings
sudo touch /etc/systemd/sleep.conf;
sudo cp /etc/systemd/sleep.conf /etc/systemd/sleep.conf.bak; # backup the orig values
echo "
# wait an hour before hibernating
HibernateDelaySec=3600
" | sudo tee -a /etc/systemd/sleep.conf; # appends to file

# test suspend-then-hibernate works on this system
sudo systemctl suspend-then-hibernate

# configure your computer to always suspend-then-hibernate
sudo touch /etc/systemd/logind.conf;
sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf.bak; # backup the orig values
echo "
# suspend-then-hibernate by default
HandleSuspendKey=suspend-then-hibernate
HandleLidSwitch=suspend-then-hibernate
" | sudo tee -a /etc/systemd/logind.conf; # appends to file


# /etc/systemd/sleep.conf.d/hibernatemode.conf
# HibernateMode=shutdown

```


# deep sleep vs shallow sleep
Some computers, such as Dell XPS 13, do not ship with the ability to deep sleep (i.e., save state to memory) and instead use "suspend-to-idle" (s2idle).

More details on the different types of sleep supported by linux are documented here:
- https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/pm/sleep-states.rst

A relevant thread can be found here:
- https://www.dell.com/community/XPS/Ubuntu-deep-sleep-missing-for-xps-9310/td-p/7734008/page/1
- > This seems to stem from Microsoft pushing for S0 "modern standby" which enables the background refresh etc. while the system is in standby so that you get super quick wake from sleep and a mobile like experience from your laptop. Maybe linked to the "evo" certification also, which is the same type of thing.

You can check whether deep sleep is supported in your system or not with the following command:

```sh
cat /sys/power/mem_sleep; # you should see both `s2idle` and `deep` as options
```

If deep sleep is supported, you'll see something like
```
[s2idle] deep
```
or
```
s2idle [deep]
```
(the brackets just specify which it is using at the moment)

If deep sleep is not supported, you'll see this instead
```
[s2idle]
```

refs:
  - https://www.reddit.com/r/Dell/comments/8b6eci/xp_13_9370_battery_drain_while_suspended/dx4gl0g/?context=8&depth=9
  - https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/pm/sleep-states.rst
  - https://askubuntu.com/questions/1115572/ubuntu-18-04-dell-xps15-9570-impossible-to-reliably-suspend-hibernate

