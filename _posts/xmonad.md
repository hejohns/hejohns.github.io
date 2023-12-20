---
layout: post
title: xmonad
date: 2023-12-20
---
As with the [icecc post]({$ link _posts/icecc.md %}),
I'm moving [xmonad](https://xmonad.org/) from one server to another
for "less downtime"[^1].

[^1]: I'm reproducing the xmonad setup on the Dell T130 (Pentium G4600) to a container on the Lenovo P720 (dual Xeon 6142s), so I can restart other stuff w/o killing my window manager

I had all the configuration files in [my rc github repo](https://github.com/hejohns/.rc),
but I didn't document what to actually do, so here we go:

- Take a fresh debian container
    - You probably want to `adduser hejohns` and `apt install sudo` and  `adduser hejohns sudo`
    since we want to `ssh -X` into this box later[^2]
- Install ghc/cabal w/ ghcup
    - See <https://www.haskell.org/ghcup/install/>
    - Install the required system packages (eg curl, libffi-dev, libgmp-dev, …)
    - Do their `curl | sh` thing
    - If this container is just for xmonad, can do a minimal ghcup install
    - Can probably just use the default version of ghc.
    You can `ghcup tui` to install something newer, but if you pick something too bleeding edge, you might get cabal package constraint errors later
- Install xmonad
    - See <https://xmonad.org/INSTALL.html>
    - Install the required system dependencies (eg libx11-dev, libxss-dev, …)
    - `cabal update`
    - `cabal install --lib xmonad xmonad-contrib`
    for the libraries xmonad needs on recompile
    - `cabal install xmonad` for the actual executable
- You still need some X infrastructure for xmonad to work
    - At the least, you need `apt install x11-utils` or else xmonad will error out on some missing executable
    - This might be included in `apt install xorg`
    - I don't know anything about X,
    so I don't even know if you need an X server or not--
    but I think it didn't work until I installed one
- I'm lazy, so `xmonad --recompile` and wait for it to error out b/c of the missing *xmonad.hs*
- This creates *~/.config/xmonad* for you (for create it yourself)
- `git clone` the rc repo or equivalent
(for *xmonad.hs*, *.xsession*, and associated systemd files)
- `cp` the *xmonad.hs* into *~/.config/xmonad*
- Confirm that `xmonad --recompile` works now
- `xmonad --replace` won't work yet since the X env isn't setup properly
- `cp` the systemd files in rc under *etc/systemd/user* to their respective place in the actual system
- You probably need to `systemctl --user enable` the two services
- `cp` the *xsession* into *~/.xsession*
- Finally add `(bash ~/.xsession > /dev/null 2>&1 &)` or equivalent to your *.bashrc*

[^2]: I did this all as root the first time, and had to do it all over again as my own user since so much of the ghcup and X stuff is per-user.

## Summary
Now, when you're on your desktop, you can `ssh -X` into this box we just setup
and when the bashrc gets sourced on login,
the xsession file will also run and start the systemd user target to fire up
xmonad and xcompmgr.

Oh right, so you probably want to install `xcompmgr` as well.
The systemd file in the repo currently assumes it was installed with `nix`,
but you can just install it with `apt` and change the path.
(I did that just now.)

My desktop is a "dumb" client
(actually, it's a minimally configured debian + xfce install),
so I can outsource the ghc and xmonad mess to another machine this way. 

Why the fuss with systemd?
xmonad used to segfault all the time for some reason,
and having your (remote) window manager suddenly stop really sucks.
A systemd user service that automatically restarts seemed like the right solution.
(When xmonad restarts, all the tilings get reset, but at least a window manager is still running.)

Actually, I don't think I've had xmonad segfault in a long time now,
but the principle stands.
