---
layout: page
title: uLinear Algebra
permalink: /pages/linalg.html
---

# uLinear Algebra

This is where I share thoughts, projects, and insights about uLinear Algebra.

## All uLinear Algebra Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "linalg" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
