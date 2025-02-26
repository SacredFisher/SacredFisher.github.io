---
layout: default
title: Home
---

# Welcome to My Multi-Topic Blog

Exploring ideas across multiple disciplines.

## Recent Posts

<div class="posts-grid">
  {% for post in site.posts limit:6 %}
    <div class="post-preview">
      <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
      <p class="post-meta">{{ post.date | date: "%B %d, %Y" }} • 
      {% for category in post.categories %}
        <a href="/pages/{{ category }}.html">{{ category }}</a>{% unless forloop.last %}, {% endunless %}
      {% endfor %}
      </p>
      <p>{{ post.excerpt }}</p>
    </div>
  {% endfor %}
</div>
