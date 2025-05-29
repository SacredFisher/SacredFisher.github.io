---
layout: page
title: graphs
permalink: /pages/graphs.html
---

# graphs

graph theory thoughts, problems, approaches, interesting intuitions.

## All graphs Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "graphs" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
