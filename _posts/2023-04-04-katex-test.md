---
layout: post
title:  "latex with katex"
categories: site-construction
---

I looked up something like "jekyll latex"
and found some helpful resources:
- [link1](https://codewrites.me/jekyll/katex/blog/2020/08/26/use-katex-gh-pages/)
- [link2](https://www.xuningyang.com/blog/2021-01-11-katex-with-jekyll/)

It surprisingly… just works.
Just had to c/p that stuff into a `_includes/custom-head.html`--
although rn there's a quirk w/ minima that the latest stable version is missing some features like custom-head.html,
so I had to use minima master.
Followed [this github comment](https://github.com/jekyll/minima/issues/472#issuecomment-588586974).

I'm not 100% sure katex is running v. mathjax--
I don't know how to tell--
but the rendering works one way or another.

## katex examples

double dollar sign
$$f : A \to B \in \mathcal{P}B$$

some more text

katex and katex display w/o dollar sign

{% katex %}
f : A \to B \in \mathcal{P}B
{% endkatex %}

{% katex display %}
f : A \to B \in \mathcal{P}B
{% endkatex %}

single dollar sign inside katexmm
{% katexmm -%}
$f : A \to B \in \mathcal{P}B$
{%- endkatexmm %}
