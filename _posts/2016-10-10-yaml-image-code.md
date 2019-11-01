---
title: "Working out images in yaml headers"
subtitle: "There are sooo many tricks and tips out there!"
layout: post
bigimg: /img/tools.jpg
tags: ["r", "rmd", "RStudio", "tools", "general"]
---

`yaml` content defines what the program should do with the file once it is opened. This is just a set of notes on the different ways to input images into the `yaml` content.

### `img:`

### `image:`

### `bigimg:`

And then the other rules such as:

#### `:`

#### `;`

#### `[]`

## Resources

<div class="post">
<ul>
{% for post in site.tags["external"] %}
  <a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date_to_string }})<br>
    {{ post.description }}
{% endfor %}
</ul>
</div>

## My notes

<div class="post">
<ul>
{% for post in site.tags["yaml-content"] %}
  <a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date_to_string }})<br>
    {{ post.description }}
{% endfor %}
</ul>
</div>