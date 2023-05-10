---
layout: post
date: 2023-05-10
title: multiple displays and linux graphics modules
---

So I got a HP z2 mini g3 recently
(to replace an existing dual monitor setup, which is relevant.
The optiplex 780 usff and its core 2 duo E8400 is a real workhorse.),
which has an intel xeon e3-1225 v6
(which could actually replace the pentium G4600 in my T130…[^1])
and a mobile nvidia quadro m620.

[^1]: especially while the disposition center has the z2 mini g3 's for less than what you typically find just the e3-1225 v6 for…

The box has four display port ports in the back, along with a BIOS option to send the integrated graphics along one of the ports.
One monitor worked fine. I only had a single display port adaptor[^3], so I had to wait until today to hook up the second monitor.

[^3]: my monitors are old. VGA always works; I guess DVI-D is alright.

But I ran into this strange issue where only one display port would work at a time, integrated graphics disabled,
and when I enabled the integrated graphics to try to run two monitors 1-1, X11 completely failed to start for reasons mere mortals like myself can't begin to comprehend.
Apparently the red flag should of been the tons of `modprobe` 'key rejected' or 'drm' errors and the like,
and that `systemctl status --failed` complained about `nvidia-persistenced` and whatever the kernel module loader service is[^2].

[^2]: I mean… the single display worked fine with all the errors?

There's probably a downside to this I should care about but it seems like *disabling secure boot* does the trick and `systemctl status --failed` no longer shows anything.

I actually didn't try this until I tried updating the BIOS, and one of the steps-- which required loading a kernel module-- failed due to the signing issue.
I don't understand security so I'm going w/ the wrong answer for now and just disabling all that stuff.

