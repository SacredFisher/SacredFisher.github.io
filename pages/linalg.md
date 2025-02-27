---
layout: page
title: linalg
permalink: /pages/linalg.html
---

# linalg

linear algebra is one of the most beautiful fields i've had the privilege to learn. here i collect my thoughts on the subject as well as try to collect the best geometric intutions i've found 

## All linalg Posts

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
