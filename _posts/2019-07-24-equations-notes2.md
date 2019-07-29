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

An overall guide is here but it is very complex for the non-coding like I find.

http://docs.mathjax.org/en/latest/

## one Minute Guide to Embed Math

1. Get the CDN link for the MathJax version/variant you desire from [here](http://docs.mathjax.org/en/latest/configuration.html), e.g. `https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js`

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



#### installing `mathjax`

The easiest way to get `MathJax` and keep it up to date is to use the [Git](http://git-scm.com/) version control system to access our [GitHub repository](https://github.com/mathjax/MathJax). Use the command

```
git clone https://github.com/mathjax/MathJax.git MathJax
```

to obtain and set up a copy of MathJax.

Whenever you want to update MathJax, you can now use

```
cd MathJax
git remote show origin
```

to check if there are updates to MathJax (this will print several lines of data, but the last line should tell you if your copy is up to date or out of date). If MathJax needs updating, use

```
cd MathJax
git pull origin
```

to update your copy of MathJax to the current release version. If you keep MathJax updated in this way, you will be sure that you have the latest bug fixes and new features as they become available.

This gets you the most recently released version of MathJax. Older releases are “tagged” in Git so that you can refer to them by name (which is the version number in most cases). Use

```
cd MathJax
git tag -l
```

to see all tagged versions, and use

```
cd MathJax
git checkout <tag_name>
```

to checkout the indicated version of MathJax, where `<tag_name>` is the name of the tagged version you want to use. For example,

```
git checkout 2.7.0
```

would get you version 2.7.0 of MathJax, even though there are newer versions of MathJax available.

Each of the main releases also has a branch in which critical updates are applied (we try hard not to patch the stable releases, but sometimes there is a crucial change that needs to be made). If you want to use the patched version of a release, then check out the branch rather than the tag. Use

```
cd MathJax
git branch -r
```

to get a list of the available branches. There are separate branches for the main releases, but with `-latest` appended. These contain all the patches for that particular release. You can check out one of the branches just as you would a tagged copy. For example, the branch for the 2.5 release is `v2.5-latest`. To get this release, use

```
cd MathJax
git checkout v2.5-latest
```

and to update it when changes occur, use

```
cd MathJax
git pull origin v2.5-latest
```

One of the branches is named `develop`; this branch includes all the latest changes to MathJax. Although we try to make sure this version is a stable and usable version of MathJax, it is under active development, and at times it may be less stable than the “release” version. If you want the most recent patches before they have been formally released as a new numbered version, you can check out the `develop` branch.