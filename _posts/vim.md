---
layout: post
title: vim
date: 2024-02-24
---
Instead of doing work, I got to thinking that since I spend so much time in vim,
I should really build and configure vim from source,
instead of just using the debian packaged vim-gtk3[^1].

[^1]: 2026-09-01: I only found out within the last two weeks that debian in fact does package a "huge" build of vim without gvim called vim-nox ("vim no X")

Also I should really contribute a little to vim over time.
The only thing I've contributed back was a bug report about unicode character handling,
which someone patched and Bram merged the same day(!).

So let's keep a [fork](https://github.com/hejohns/vim) to track my config.

Building notes:
- Certain system packages need to be installed for features like gui, '+perl', '+python'
    - I won't make an exhaustive list, but see src/INSTALL
    - `make reconfig` after installing
