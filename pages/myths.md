---
layout: page
title: myths
permalink: /pages/myths.html
---

# myths

mythology and esoterica. i love the stories that created the stories we create the world with. 

## All myths Posts

<ul class="post-list">
  {% for post in site.posts %}
    {% if post.categories contains "myths" %}
      <li>
        <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
        <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
        <p>{{ post.excerpt }}</p>
      </li>
    {% endif %}
  {% endfor %}
</ul>
