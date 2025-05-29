---
layout: page
title: science
permalink: /pages/sci.html
---

# science

experiencing the world through concepts, instruments, and monitored interactions. thoughts on science and interesting developments. mostly focused on fringe topics. 

## All science Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "sci" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
