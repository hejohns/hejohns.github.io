---
layout: post
title: moving from git to darcs
date: 2023-05-14
categories: site-construction
---
I played around with `darcs` two summers ago,
but in this day and age everyone uses `git` so it's just not practical when working with other people.

That said, this is my personal site and I can do whatever I want, so I'm firing darcs back up!

The darcs site [has a page](http://darcs.net/Using/Convert) for converting between git and darcs and forth,
although I couldn't get the mark files to work,
and when exporting from darcs to git,
I needed to `sed` (or more precisely  `darcs convert export | perl -pe 's#refs/heads/trunk#refs/heads/trunk#g' | (cd ../hejohns.github.io_git-mirror/ && git fast-import)`)
to import into the correct git branch.

NOTE: Should be "refs/heads/**master**#reds/heads/trunk". I don't know why but it keeps showing up as trunk twice when I export

