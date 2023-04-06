---
layout: post
title:  "sorting the page links in the top right header"
categories: site-construction
date: 2023-04-05
---
**edit**:
should've read the minima README more carefully…

the above does work[^1], but I've switched over to the intended minima way.

**old**:
[this stack overflow post](https://stackoverflow.com/a/25513956)
explains what to do.

summary: give each page a `weight: [number]` in the front matter,
so the liquid template can sort them when displaying the header.
(requires overriding the default `_includes/header.html`.
[eg](https://github.com/hejohns/hejohns.github.io/blob/2920839b2cf4c1658c0e7dd45a1b67e1de78deb1/_includes/header.html#L4).)
[^1]: and technically works regardless of the theme, so I'm keeping this info here, in case I switch themes.
