---
layout: page
title: .mov
permalink: /pages/mov.html
---

# .mov

dreaming in real life. my thoughts on the movies i've seen. often, i'll cover the same movie multiple times as i prefer to rewatch movies and reflect on them.

## All .mov Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "mov" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
