---
layout: page
title: ai/ml
permalink: /pages/ai-ml.html
---

# ai/ml

musings on the machinespirits

## All ai/ml Posts

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
