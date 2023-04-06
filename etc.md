---
layout: page
title: etc
---

some stuff

{% for category in site.categories %}
    {% for post in site.categories[category] %}

    [{{ post.title }}]({{ post.url }})

    {% endfor %}
{% endfor %}
