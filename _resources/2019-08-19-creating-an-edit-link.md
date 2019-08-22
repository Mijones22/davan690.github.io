---
title: "Russell et. al 2015"
subtitle: "Predator-free NZ publication"
layout: post
image:  /img/working-at-night.jpg
bigimg: /img/pfnz205-header.png
tags: ["markdown", "website", "tools", "rmd", "jekyll", "TTS"]
permalink: /bookdown-template.html
---

There are so many options and I am only now trying to work out why it is not working.

## Option 1

```html
<article role="main" class="blog-post"><a href="{{ site.branch }}{{ page.path }}"> Edit this page on GitHub 
</a>
```

## Option 2

```html
<!-- Edit current page -->
  <a href="{% if page.path %}//prose.io/#davan690/davan690.github.com/master                              /{{ page.path }}{% else %}//prose.io/#zzolo/zzolo.github.com{% endif %}" target="_blank">Edit this page in Prose.io</a>```

## Option 3

Unsure why i tried this but this is a link to a pose site that you can add a blog to. An interesting option for the future ...

```html
<!-- Add post -->
<a href="//prose.io/#davan690/davan690.github.com/new/master/_posts" target="_blank">Add a post with Prose.io</a>{{ content }}
</article>
```