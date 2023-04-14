---
layout: post
title: rasterizing pdfs, among other things
date: 2023-04-14
---
- toc
{:toc}

## rasterizing/"setting" a pdf
I don't recall running into this before,
but I was trying to print a pdf that displayed fine on my computer (firefox, okular),
and the printer failed on the 8th page w/

    ERROR:
    typecheck
    OFFENDING COMMAND:
    known

which is apparently some postscript error or incompatibility with the printer.

[rasterize pdf](https://superuser.com/a/1489923)

    pdf2djvu -d 1200 input.pdf > output.djvu

I don't know how low for density (<300?) is too blurry or too high unnecessary (>1200?)
[and convert back to pdf for printing](https://superuser.com/a/100573)

    ddjvu -format=pdf output.djvu output.pdf
