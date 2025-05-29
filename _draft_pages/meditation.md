---
layout: page
title: meditation
permalink: /pages/meditation.html
---

# meditation

musings on meditation, meditation technology, possible biological grounding, etc. 

## All meditation Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "meditation" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
