---
layout: page
title: uμsiq
permalink: /pages/musiq.html
---

# uμsiq

This is where I share thoughts, projects, and insights about uμsiq.

## All uμsiq Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "musiq" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
