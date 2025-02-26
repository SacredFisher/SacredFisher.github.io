---
layout: page
title: uAI/ML
permalink: /pages/ai-ml.html
---

# uAI/ML

This is where I share thoughts, projects, and insights about uAI/ML.

## All uAI/ML Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "ai-ml" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
