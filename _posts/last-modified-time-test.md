---
layout: post
title:  "getting page last modified time"
categories: site-construction
date: 2023-04-05
---
I spent way too much time mucking around with
[a stack overflow post](https://stackoverflow.com/a/36769049)
and the minima source
to get page modification times.

You just need to write a simple jekyll hook to splice in a page's mtime,
but anyways, [jekyll-last-modified-at](https://github.com/gjtorikian/jekyll-last-modified-at)
does exactly that, but properly.
I should've looked harder-- a pure waste of time.

eg

page.last_modified_at | {{ page.last_modified_at }}
page.last_modified_at \| date: '%B, %d, %Y' | {{ page.last_modified_at | date: '%B, %d, %Y' }}
