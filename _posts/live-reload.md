---
layout: post
title: Live Reload
categories: site-construction
date: 2023-11-06
---

I've been writing posts without live reloading/preview
for some reason.
I think `--watch` didn't work or something.

In any case, I just tried this while editing the homepage,
and it's so nice, I had to make this post.

    bundler exec jekyll serve -l --lsi -H 192.168.1.100

Sometimes I have to manually refresh the browser page though
or else it gets stuck on a blank screen.

(And of course, check out the other [site-construction](/category/site-construction/) posts)
