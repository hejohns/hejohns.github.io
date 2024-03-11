---
layout: post
title: vim
date: 2024-03-10
---
Instead of doing work, I spent the better half of a day fixing my
[deoplete](https://github.com/Shougo/deoplete.nvim)
[config](https://github.com/hejohns/hejohns-vim/blob/trunk/plugin/hejohns.vim),
and added [these deoplete *sources*](https://github.com/hejohns/hejohns-vim/blob/trunk/plugins.vim)[^1] on top of the ones that ship with deoplete--
which are fabulous and could well be all you need.

[^1]: deoplete has a notion of *source*, which is what generates autocompletion *candidates* in the pum (pop up menu, as in 'pumvisible'). Sources are python3 scripts that can contribute candidates asyncly. I haven't stared much at how to write a source, but the system looks well designed at a glance.

Autocompletion *candidates* are sorted by the source that generated them,
and *ranked* between sources.
The *rank* is a *var*
(as in `deoplete#custom#var` for global configuration,
 or `deoplete#custom#buffer#var#` for buffer local configuration)
or *source* setting
(as in `deoplete#custom#source`).

*source* settings have to be set before deoplete starts up,
which I'm pretty sure means before `deoplete#initialize()`,
but *var*s can be updated any time.
I'm not sure why some sources have the *rank* or the *mark*
as a *source* settings,
while others have it as a *var*, but it's not a big deal either way.

A *mark* is a string shown on the right of a *candidate* in the pum,
to show which *source* it came from.
The default *marks* are something like '[A]' for the stock "around" source,
or '[B]' for the stock "buffer" source.

I've changed the *marks* to make it more obvious,
like '[buf]' for "buffer" or '[dict]' for the "dictionary" third-party source.

**Note** that not all sources are asynchronous.
One thing I haven't dug far enough into is how *sources* are written,
and deoplete implements asynchronous *candidate* generation and pum update.
But some sources are explicitly synchronous,
namely the "omni" (omnicompletion) source,
which takes candidates from vim's omnifunc.

This is one of (vanilla) vim's primary autocompletion hooks,
which means many other plugins generate *candidates* with omnifunc,
but which also means that "omni" *candidate* generation is synchronous,
as vim is.

In general, any *source* that calls vimscript is synchronous.

This was my original problem:
in some cases, autocompletion would take so long, vim was unusable.
I'd either have to turn off automatic autocompletion, or <C-c> the autocompletion every time.
This was usually when I was using vimtex, which searches through all the packages for completions or something.

So deoplete solves the general problem by providing vim with asynchronous autocompletion,
but of course you any time you try to use vim's omnifunc,
you have the original issue.

I bring this up because as is, I'm still using the "omni" source,
which means that the original problem is still possible.
I haven't observed it recently, but this is a note to my future self.
