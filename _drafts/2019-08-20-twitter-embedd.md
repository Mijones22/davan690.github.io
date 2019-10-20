---
layout: post
title: Embedding twitter
subtitle: A quick script
image: /img/twitter.png
bigimg: /img/twitter.png
tags:
  - markdown
  - website
  - tools
  - rmd
  - jekyll
  - TTS
  - social
permalink: /twitter-embedd.html
published: true
---

There is a lot of information that we use from twitter and other social platforms that inform researchers. Here is a way to embed a twitter post into an `html` document and subsequently any `rmd` file.

``` {html} <blockquote class="twitter-tweet">
    <p lang="en" dir="ltr">Sunsets don&#39;t get much better than this one over 
        <a href="https://twitter.com/GrandTetonNPS?ref_src=twsrc%5Etfw">@GrandTetonNPS</a>. <a href="https://twitter.com/hashtag/nature?src=hash&amp;ref_src=twsrc%5Etfw">#nature</a> 
        <a href="https://twitter.com/hashtag/sunset?src=hash&amp;ref_src=twsrc%5Etfw">#sunset</a> <a href="http://t.co/YuKy2rcjyU">pic.twitter.com/YuKy2rcjyU</a>
        </p>&mdash; US Department of the Interior (@Interior) 
        <a href="https://twitter.com/Interior/status/463440424141459456?ref_src=twsrc%5Etfw">May 5, 2014</a>
        </blockquote>
        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8">
</script>
```

And the rendered html file looks like below:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Sunsets don&#39;t get much better than this one over <a href="https://twitter.com/GrandTetonNPS?ref_src=twsrc%5Etfw">@GrandTetonNPS</a>.<a href="https://twitter.com/hashtag/nature?src=hash&amp;ref_src=twsrc%5Etfw">#nature</a> <a href="https://twitter.com/hashtag/sunset?src=hash&amp;ref_src=twsrc%5Etfw">#sunset</a> <a href="http://t.co/YuKy2rcjyU">pic.twitter.com/YuKy2rcjyU</a></p>&mdash; US Department of the Interior (@Interior) <a href="https://twitter.com/Interior/status/463440424141459456?ref_src=twsrc%5Etfw">May 5, 2014</a></blockquote><script async src="https://platform.twitter.com/widgets.js" charset="utf-8">
</script>
