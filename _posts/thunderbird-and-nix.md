---
layout: post
title: "Thunderbird and Nix"
date: 2024-1-08
---
This is the second time I've come across this issue,
and since it seems I'd forgotten about it after the first time,
I'm making a note here.

## Context
I'm using nix, as installed by `apt` (on debian).
And thunderbird[^1] is installed by nix,
to get the daily release[^2].

[^1]: not my email client of choice, but I can't use mutt with my university gmail, and I get html support this way

[^2]: for absolutely no reason, especially considering the amount of plugins that are always losing version support, and issues like the one in this post

I'm using using the [external-editor-revived](https://github.com/Frederick888/external-editor-revived)
plugin so I can write emails in vim.
The setup turns out to be a bit finicky with nix though.

## Issue
After `nix profile upgrade '.*'` ing thunderbird,
when I try to use the external editor,
I get the following errors[^3] as some sort of floating X11 dialog/notification box:

[^3]: paraphrased from two different pictures of different thunderbird configurations/instances, so the libraries don't match up, but you get the point. Actually these may be right, but I don't guarantee it

> gvim: /nix/store/.../libc.so.6: version 'GLIBC_2.38' not found
> (required by /nix/store/…-libcap-2.69-lib/lib/libcap.so.2).
> 
> gvim: /nix/store/.../libc.so.6: version 'GLIBC_2.38' not found
> (required by /nix/store/…-libtool-2.4.7-lib/lib/libltdl.so.7).
>
> …

And the external editor doesn't fire up.

My `ldd --version` on my host debian system
shows glibc version 2.37.

Note that gvim is installed through apt,
on the host system (the "optiplex780" which is actually a hp z2 mini g3).
A similar error happens on the T130
when using konsole and vim,
where konsole is installed with nix.

## Resolution
I'm embarrassed to say I still can't make heads or tails of how nix works,
much as I've tried.
So I don't know exactly why some part of the process wants the host system to have
what's presumably the glibc version used to build thunderbird.

I hope eventually I'll figure this one out,
but the workaround I can live with for now is just to either

1. not upgrade thunderbird too much (rollback if it uses a glibc version I don't have yet)
2. temporarily live w/o a working external-editor until the debian glibc version catches up (which is iirc what I did the last time this happened). And then 1.

