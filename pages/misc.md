---
layout: page
title: misc.
permalink: /pages/misc.html
---

# misc.

whatever doesn't fit anywhere else.

## All misc. Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "misc" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
