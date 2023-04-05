---
layout: post
title:  "katex test"
categories: site-construction
---

(This post has a fake time to test the access times.)

helpful resources:
- [link1 test](https://codewrites.me/jekyll/katex/blog/2020/08/26/use-katex-gh-pages/)
- [link2](https://www.xuningyang.com/blog/2021-01-11-katex-with-jekyll/)

double dollar sign
$$f : A \to B \in \mathcal{P}B$$

some more text

katex and katex display w/o dollar sign

{%- katex -%}
f : A \to B \in \mathcal{P}B
{%- endkatex -%}

{%- katex display -%}
f : A \to B \in \mathcal{P}B
{%- endkatex -%}

single dollar sign inside katexmm
{%- katexmm -%}
$f : A \to B \in \mathcal{P}B$
{%- endkatexmm -%}
