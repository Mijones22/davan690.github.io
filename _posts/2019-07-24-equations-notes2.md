---
title: "Blog ideas 2.2"
subtitle: "A list of snaps"
layout: post
tags: ["overview", "website", "research", "tools"]
image: /img/center-logo-white.png
bigimg: /img/
permlink: fun-and-games2.html
---

A short rundown for math in jekyll. This is also an overlap for RMarkdown, bookdown and blogdown math...

## one Minute Guide to Embed Math

1. Get the CDN link for the MathJax version/variant you desire, e.g. `https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML`

   Despite the given version `2.7.5`, this always references the **latest** version! Learn more at [MathJax' getting started guide](https://www.mathjax.org/#gettingstarted).

2. Open `./_config.yml` and add the `ext-js` key to the default YAML values for a post:

```
# Default YAML values (more information on Jekyll's site)
defaults:
  -
    scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
      comments: true  # add comments to all blog posts
      social-share: true # add social media sharing buttons to all blog posts
      ext-js: "https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML"
```

3. Use `$$ ... $$` for display math in your posts! Inline math is hard to get working with `\( ... \)` working. Possibly, \ is stripped in Markdown (?). In any case, `$ ... $` does **not** work by default as it's disabled by MathJax; again, learn more at [MathJax' docs on putting mathematics on a web page](https://docs.mathjax.org/en/latest/start.html#putting-mathematics-in-a-web-page).



## Resources

- MathJax: [Home](https://www.mathjax.org/) / [Using the MathJax Content Delivery Network (CDN)](http://docs.mathjax.org/en/latest/start.html#using-the-mathjax-content-delivery-network-cdn) / [Using MathJax in a Theme File](http://docs.mathjax.org/en/latest/misc/platforms.html?highlight=jekyll#using-mathjax-in-a-theme-file)
- Jekyll: [Math Support - Jekyll Doc](https://jekyllrb.com/docs/extras/#math-support)
- Kramdown: [Math Blocks](http://kramdown.gettalong.org/syntax.html#math-blocks) / [Math Support](http://kramdown.gettalong.org/converter/html.html#math-support) / [Math Engine MathJax](http://kramdown.gettalong.org/math_engine/mathjax.html)
- [Displaying Math in RSS feeds - Noam Ross](http://www.noamross.net/blog/2012/4/4/math-in-rss-feeds.html)
- [Using Jekyll and Mathjax - Dason Kurkiewicz](http://dasonk.github.io/blog/2012/10/09/Using-Jekyll-and-Mathjax.html)
- [MathJax with Jekyll - Gaston Sanchez](http://gastonsanchez.com/opinion/2014/02/16/Mathjax-with-jekyll/)
- [How to use MathJax in Jekyll generated Github pages - Haixing Hu](http://haixing-hu.github.io/programming/2013/09/20/how-to-use-mathjax-in-jekyll-generated-github-pages/)
- [在github pages上使用MathJax - Kung Hiu](http://www.anaharb.com/2014/0215/Jekyll-MathJax/)
- [MathJax with Kramdown - Toban Wiebe](http://tobanwiebe.com/blog/2016/02/mathjax-kramdown)




## My notes

The above notes are extended from a blog post from by [Dean Attali](https://github.com/daattali) and this thread: 

https://github.com/daattali/beautiful-jekyll/issues/195

