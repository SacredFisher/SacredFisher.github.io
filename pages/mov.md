---
layout: page
title: u.Mov
permalink: /pages/mov.html
---

# u.Mov

This is where I share thoughts, projects, and insights about u.Mov.

## All u.Mov Posts

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
