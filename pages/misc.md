---
layout: page
title: uMiscellaneous
permalink: /pages/misc.html
---

# uMiscellaneous

This is where I share thoughts, projects, and insights about uMiscellaneous.

## All uMiscellaneous Posts

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
