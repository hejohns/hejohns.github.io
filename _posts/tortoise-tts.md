---
layout: post
title: tortoise text to speech (and piper)
date: 2023-10-10
---

## Motivation

I'm getting my butt kicked by EECS 582.
We're assigned four papers a week to read--
two for Tuesday, two for Thursday--
and it's just too much to read with attention to detail.
But I don't think the point *is* to read every paper in detail.
Or at least that's not what I really want out of it.

This seems to me an exercise in how to quickly synthesize/accumulate/index
ideas and knowledge,
and how to summarize/distill it quickly.
(The paper reviews used to take me hours, but there just isn't the time for that.
 I've been cramming it into ~45 minutes.)

As such, I'm looking for fast ways to get to the summary,
if that's the end-goal, so to speak.
There's some tips and tricks people will tell you when it comes to reading papers,
but I wanted to try something more aggressive.

## text to speech tools

My eyes were feeling uncomfortable from (I have no medical backing to say this)
all the, well, load, of screen + reading time,
so the natural conclusion was to try *listening* to papers.

So I copy/pasted the entire paper pdf into a text file,
removed line breaks (eg "libr-\nary"),
and converted the text to audio with a tts tool.

Of course this requires that the paper has signifiant amounts of prose.
The papers we're reading in 582 do[^1] (and more on the effectiveness of the tts tools on papers below), but I have yet to try other areas.

[^1]: figures don't meaningfully work if they do at all. They usually don't get copied as text, and if some parts of the figure do, it's all mangled. That said, captions *do* work, and are sometimes enough to get the general idea.

I first tried some online tools, but wasn't very satisfied.
I'm sure there are good services online though.

In any case, I ended up trying local text to speech tools,
and the two that I got working were:
- [piper](https://github.com/rhasspy/piper)
- [tortoise-tts](https://github.com/neonbjb/tortoise-tts)

(festival kept crashing, and I think I forgot to try eSpeak-ng.)

### piper
There's not much to say.
Piper "just works".
It's fast-- it can stream audio-- and sounds good enough to listen to papers.
I've been using **cpu inference. I'm not sure if it supports gpu.

This is what I've actually been using since tortoise...
didn't "just work" out of the box.

For some reason, the wav file piper produces isn't readable on my sony icd,
so I had to ffmpeg it to an mp3.
### tortoise
Okay... this is the real reason I wrote this post.

The output quality of tortoise is fantastic.
Yes, it's slow, but I'm willing to put up with it if it works--
just run it overnight/overnight + a day.
I have yet to really evaluate it as a paper reading tool, because I've been so bogged down trying to get it working.

#### docker
First, **cpu** only:

The Dockerfile provided works with some small modifications
which others noted in the issue comments and a PR.
So I made a [fork](https://github.com/eecs582-andlars-hasinha-hejohns/tortoise-tts)
with those patches.

tortoise hardcodes cuda in some places, so a couple patches are needed, but it does run with only cpu.
Just invoke `docker run` without `--gpus all`.
#### gpu
I have an nvidia mobile gpu on my desktop (the one from [the post about nvidia kernel modules]({% link _posts/linux-graphics-modules.md %}),
so I thought I'd try to see how it compares to cpu tortoise,
which I'd been running on a dual xeon gold 6142.

It became issue after issue.

So first you have to install `nvidia-container-toolkit`.
Then when I added `--gpus all` back to tortoise's `docker run`,
docker failed to pickup any gpus.

Okay... everything seemed fine with the gpu setup (`nvidia-smi` shows output, no systemd nvidia service errors like [the post about nvidia kernel modules]({% link _posts/linux-graphics-modules.md %})),
except `nvidia-detect` errored out,
complaining about not being able to identify the debian version.

After a display of poor debugging skills, I finally looked at `vim $(which nvidia-detect)` and searched for the error message.
It turned out the nvidia-detect script just hardcodes some logic for each debian release,
and looks up the value in `/etc/debian_version` to dispatch one of the cases.
If `/etc/debian_version` doesn't match any of the cases,
an error message prints about not being able to identify  the debian version.

Well, I have debian testing on my desktop, with
`cat /etc/debian_version`[^2] showing `trixie/sid`.
Which just wasn't a case.
nvidia-detect only hardcoded up to bookworm/debian 12.

[^2]: what is this used for??

My best guess is that the proper fix is to just wait for a newer nvidia-detect.
But I wanted some more immediate closure, so I manually set `/etc/debian_version`
to "bookworm/12", and everyone was happy.

Then docker `--gpus all` was finally happy, but tortoise still wasn't using the gpu.
Another *insert search engine* adventure later about cuda versions
suggested that I did in fact have a card that supported cuda 12.0,
which should work with tortoise
(I think tortoise itself wanted cuda 11.7, and the Dockerfile wanted the nvidia cuda 12.2 docker image, which may have worked, but I downgraded it to 12.0 to match my host system).

Then the online oracles said to run `python -m torch.utils.collect_env`
to see what pytorch was up to.
And indeed, it showed that pytorch was *not* built with cuda.

I'm not sure why, given that the Dockerfile seems to install pytorch with cuda,
but in any case, there's no shortage of hacks here, so the oracle said to
just `pip uninstall torch` and reinstall it with cuda, as per [the pytorch site](https://pytorch.org/get-started/locally/),
so I did,
and `python -m torch.utils.collect_env` changed to show that cuda was enabled.
This is all in a docker container, so I don't actually mind how much of a hack this is.

With pytorch finally gpu enabled, I fired up tortoise for the nth time,
and it quickly died with a cuda out of memory error.

The cognoscenti may have noticed that I wanted to do this on a quadro M620
with 2GB ram.
Me being an ML-ignorant fool, didn't think that that was insufficient.

Even with `batch_size = 1`, as small as possible[^3],
tortoise still kept running out of memory.
From what I could find in the issue comments, 4GB is considered a small memory footprint, so it may be that tortoise simply cannot run on 2GB gpu ram.

[^3]: I'm assuming that means something to the ML-literate

So I finally got some closure, and four hours less sleep,
but on the plus side,
docker's quite pleasant to use?
