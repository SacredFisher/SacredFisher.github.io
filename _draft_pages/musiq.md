---
layout: page
title: μsiq
permalink: /pages/musiq.html
---

# μsiq

decorating time. my thoughts interesting music i've listened to.

## All μsiq Posts

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
