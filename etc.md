---
layout: page
title: etc
weight: 99
---

some stuff

{% for category in site.categories %}
    {% for post in site.categories[category] %}

    [{{ post.title }}]({{ post.url }})

    {% endfor %}
{% endfor %}
