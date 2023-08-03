---
layout: post
title: nic bonding
date: 2023-08-03
---

- nmtui
- edit a connection
- add
- type bond
- two slaves
  - idk why but it seems like you need to create two entirely new connections
  - so deactivate the old connections before activating the bond
- set primary device (eg `eno2`). This is the mac address used?
- status:
  - `nmcli con`
  - `ip address`
- the mac address changes (not sure why), so you probably have to change the dhcp server settings to statically lease the old ip to the bond mac address

redhat has some documentation online
