---
layout: page
title: umath
permalink: /pages/math.html
---

# umath

This is where I share thoughts, projects, and insights about umath.

## All umath Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "math" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
