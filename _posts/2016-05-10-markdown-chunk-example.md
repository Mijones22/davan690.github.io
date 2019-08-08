---
layout: post
title: "Code chunks in RMarkdown"
subtitle: "Trying to link RMarkdown to Jekyll"
tags: ["test", "tools","rmd", "rstudio","home"]
image: /img/testing-image.jpg
permlink: /markdown-chunks.html
---

## Option 1

~~~
var foo = function(x) {
  return(x + 5);
}
foo(3)
~~~

## Option 2

```javascript
var foo = function(x) {
  return(x + 5);
}
foo(3)
```

## Option 3

And here is the same code yet again but with line numbers:

{% highlight javascript linenos %}
var foo = function(x) {
  return(x + 5);
}
foo(3)
{% endhighlight %}
