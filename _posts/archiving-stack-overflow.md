---
layout: post
title: archiving stack overflow (for the forest)
date: 2024-06-17
---

## First Iteration

(Note: I call any stack exchange site "stack overflow".)

Stack overflow has some phenomenal content.
I won't wax on what precisely is great about stack overflow, but one issue is
that the comments are often too good.

This is an issue because comments are meant to be more ephemeral, and I'm
already generally worried about broken hyperlinks-- the existence of comments
is not stable.

The wayback machine is essentially *the* solution, except it seems to break
some math rendering on stack overflow.
I'm not sure how deep of an issue this is, but I'd like an archival solution
that doesn't have this shortcoming.

`wget` seems to be the tool for the job, so this post is really to collect the
`wget` flags we should use for our own web snapshotting.

    wget --timestamping --convert-links --page-requisites --wait=1 --random-wait LINK

This will download a single html page, with (hopefully) any resources required
for that page, in a hierarchical directory structure.

## Second Iteration

So I was completely and utterly wrong.

I just spent a low several hours realising that the command should also have `--adjust-extension`, so the full `wget` command should be

    wget --timestamping --convert-links --page-requisites --adjust-extension --wait=1 --random-wait LINK

Except that the stack overflow "Show $$n$$ more comment" button is javascript
(uses javascript to load the rest of the comments).
Which means any `wget` solution fails to save any collapsed comments.
And the much of the point was to save the (full of content) comments.

So we instead need a tool to expand the comments by running the javascript
click events, *then* save the page as it appears.
The method we settled on and hacked up is to use [selenium webdriver](https://www.selenium.dev/documentation/webdriver/)
to run [javascript to expand all comments](https://meta.stackoverflow.com/q/268400),
then save the page with Firefox's "Save Page As…", scripted with `xdotool`.

The slightly less gross way would be to dump the page from selenium, but for
some reason the stack overflow MathJax initially loads fine, then disappears
with "math processing error".

Yeah… not the way I wanted this to go but I think this second version works.
