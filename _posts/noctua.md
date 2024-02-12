---
layout: post
title: noctua fans
date: 2024-02-12
---
I finally replaced the cpu and case fan on the T130 with noctua fans
because I couldn't bear the racket anymore--
I can't remember if the stock fans just wouldn't spin slower or were just loud--
and I have to say I'm an instant fan-- no pun intended.
The box is finally quiet. It only took ~6 years. Speaking of which, those stock fans were… dirty.

I had to increase the minimum pwm from 5% to 25%,
or else iDRAC would warn that the fan rpm is *too low*.

This post is to point out that the noctua voltage reducing cable ("low noise adapter") is unnecessary, unless the fans are stuck at high rpm for whatever reason (eg non-pwm fans).
I had installed them first, so I had to then remove them and turn all the fans around, which was annoying and a little painful-- those rubber case fan plugs are so hard to reattach.
