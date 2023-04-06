---
layout: page
title: about
---

something here

## specs
made w/
- `jekyll`, version {{ site.jekyll-version }}
- `{{ site.theme }}` theme, version {{ theme.version }}
- plugins:
{% for plugin in site.plugins %}   - `{{ plugin }}`
{% endfor %}
