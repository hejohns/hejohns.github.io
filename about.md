---
layout: page
title: about
---
## about me

in contrast to

## about this site
This site's repo is [here](https://github.com/hejohns/hejohns.github.io)[^1].
And as long as github pages is a thing, the site is up [here](https://hejohns.github.io/).

[^1]: If you really want to view page history, you'll have to `git clone` and serve old versions of the site yourself.  I'll be nice to the git history.

I've amalgamated too much of the internet to keep track of what came from where
(apropos jekyll site construction),
but I'm trying to reference as much as possible in the [site-construction](/category/site-construction) posts.

### specs
made w/
- `jekyll`, version {{ site.jekyll-version }}
- `ruby`, version {{ site.ruby-version }}
- `{{ site.theme }}` theme, version {{ theme.version }}
- plugins:
{% for plugin in site.plugins %}   - `{{ plugin }}`
{% endfor %}
