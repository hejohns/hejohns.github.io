---
layout: post
title: icecc
date: 2023-12-19
---
It's break and I'm cleaning up some computer stuff.

One thing I hadn't gotten around to was setting up [icecc](https://github.com/icecc/icecream),
which seems like a more automated distcc.
I thought I'd have to write systemd services for `iceccd -d` and `icecc-scheduler -d` myself,
  but the debian package for icecc already does it for you[^1],
which I was quite pleased about.

[^1]: As you can probably guess, we both named them `iceccd.service` and `icecc-scheduler.service`…

So all it takes is
- `apt install icecc`
- `systemctl enable icecc-scheduler`

From what I can tell, `iceccd` and `icecc-scheduler` automagically form a local (sub)network-wide cluster, which can be viewed with `icecream-sundae`.

And of course, as the icecc README says, clients of the cluster need to
`export PATH=/usr/lib/icecc/bin:$PATH`.

That's it.
