---
layout: post
title: archiving stack overflow (for the forest)
date: 2024-06-17
---
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

Firefox has "Save Page As…", which works great and can save the post as a
single html file, but it'd also be nice to have a more portable solution, in a
loose sense of the word.

`wget` seems to be the tool for the job, so this post is really to collect the
`wget` flags we should use for our own web snapshotting.

    wget --timestamping --convert-links --page-requisites --wait=1 --random-wait LINK

This will download a single html page, with (hopefully) any resources required
for that page, in a hierarchical directory structure.

At first, I thought this was a mal-feature, and wanted Firefox's all-in-one
html page semantics, but this might actually be better for the forest since all
the different archived links will be stored hierarchically, instead of flat.
