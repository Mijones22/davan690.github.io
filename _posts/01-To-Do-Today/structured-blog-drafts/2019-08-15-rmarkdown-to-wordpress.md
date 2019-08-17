 2019-08-15-rmarkdown-to-wordpress

```{YAML}
title: "RMarkdown to wordpress"
subtitle: "What is it all about?"
layout: post
image: /img/tools.jpg
bigimg: /img/tools.jpg
tags: ["website", "overview", "general"]
use-site-title: true
permalink: wordpress-compile-rmd.html
```

I investigated these resources last year when I was trying to work with `wordpress` and `RStudio` to write blogs. I thought this might be helpful for future reference.

## Smart People

*Blog post about Blog Posting from R Markdown to WordPress from somewhere else*

Whoa. Some people are really friggin’ smart. Well, lots of people are, but right now I’m specifically referring to Duncan Temple Lang ([@duncantl](http://twitter.com/duncantl)), who developed the R package, RWordPress, and William K. Morris ([@wkmor1](http://twitter.com/wkmor1)), Yihui Xie ([@xieyihui](http://twitter.com/xieyihui)), and Jared Lander ([@jaredlander](http://twitter.com/jaredlander)), who developed the knit2wp function in knitr. These two packages make it possible to write a blog post in R Markdown and then publish it directly to a WordPress site. This post walks you through the steps to do so, inspired in large part by [Xie’s instructions](https://yihui.name/knitr/demo/wordpress).

[cue sparklers]
![](../../_resources/80aba8c8c7b20e4ecca23a26879ba7a1.jpg)

## Three Easy Steps

### 1. Install the relevant packages

First, you need to install the relevant packages, which are knitr, devtools, and RWordPress. Here’s the R code:

if (!require('knitr')) {
install.packages("knitr")
}
if (!require('devtools')) {
install.packages("devtools")
}
if (!require('RWordPress')) {
devtools::install_github(c("duncantl/XMLRPC", "duncantl/RWordPress"))
}

### 2. Write Your Blog Post in R Markdown

Now write your blog post in R Markdown. You can use this very post as a starting point, if you’d like. I’ve linked the Rmd file [here](https://mfr.osf.io/render?url=https://osf.io/hj2yq/?action=download%26mode=render), which I created in RStudio (File –> New File –> R Markdown…). The Rmd file ultimately contains all of your blog post content. You can find all kinds of help with R Markdown [by simply Googling it](http://lmgtfy.com/?q=R+Markdown+basics).

### 3. Upload

Once you’ve created your blog post as an Rmd file, it’s time to publish it. You first need to tell RWordPress the information to use to get to your WordPress site. Simply input the correct user, password, and URL in the relevant places in the options line below.

#activate the necessary libraries
library(RWordPress)
library(knitr)

# Tell RWordPress how to set the user name, password, and URL for your WordPress site.

options(WordPressLogin = c(user = 'password'),
WordPressURL = 'https://yoursite.wordpress.com/xmlrpc.php')

Finally, invoke the knit2wp function, which tells knitr to create the html code and upload it to your WordPress site. Specify the Rmd file name, blog post title, and any additional arguments. Here I’ve set a “publish = FALSE” argument; this means that the post will get uploaded but it won’t be publicly available just yet. This is ideal if you want to head to your WordPress site to preview the post before publishing manually. If you set “publish = TRUE”, then it’ll be publicly available immediately.

# Optional: If you want to see all of the knit2wp arguments that are possible, run this line.

?knit2wp

# If need be, set your working directory to the location where you stored the Rmd file.

setwd("C:/Users/user/Documents")

# Tell knitr to create the html code and upload it to your WordPress site

knit2wp('RWordPress_post.Rmd', title = 'Blog Posting from R Markdown to WordPress',publish = FALSE)

## Done

That’s it. I’m pretty new to doing this but I already love being able to write blog posts in R Markdown. It’s perfectly suited to the task, even for posts that don’t rely on displaying and/or running R code. The RWordPress and knitr packages in combination with R Markdown make it especially easy for WordPress bloggers to get their ideas out of the brain and into public view.

It’s also worth pointing out something I learned from Kris Shaffer ([@krisshaffer](http://twitter.com/krisshaffer)), when he appeared on a [Teaching in Higher Ed podcast recently](http://teachinginhighered.com/podcast/what-we-should-know-about-apis/).

He made the good point that one should retain personal copies of one’s posts. When you have your blog post saved in .Rmd format, you’ve achieved this goal. Bonus.

[  [](../../_resources/948b2d7d8a656c98a7512e29222dae8d.webp)''](https://giphy.com/gifs/win-nXxOjZrbnbRxS?utm_source=iframe&utm_medium=embed&utm_campaign=Embeds&utm_term=)

 ![](data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' class='_1kUT9JUnNbAcSluG824OLJ js-evernote-checked' data-evernote-id='28'%3e %3cdefs data-evernote-id='73' class='js-evernote-checked'%3e %3cclipPath id='cutout' data-evernote-id='74' class='js-evernote-checked'%3e %3crect x='-41' y='0' width='100%25' height='100%25' data-evernote-id='75' class='js-evernote-checked'%3e%3c/rect%3e %3crect x='0' y='41' width='100%25' height='100%25' data-evernote-id='76' class='js-evernote-checked'%3e%3c/rect%3e %3c/clipPath%3e %3c/defs%3e %3c/svg%3e)

Have you posted to WordPress through R Markdown? Got any general suggestions for blogging via R Markdown? Share your experiences in the comments below or via Twitter [@HeatherUrry](http://twitter.com/HeatherUrry).

This entry was posted in [R](http://sites.tufts.edu/emotiononthebrain/category/r/) and tagged [knitr](http://sites.tufts.edu/emotiononthebrain/tag/knitr/), [R Markdown](http://sites.tufts.edu/emotiononthebrain/tag/r-markdown/), [RWordPress](http://sites.tufts.edu/emotiononthebrain/tag/rwordpress/), [WordPress](http://sites.tufts.edu/emotiononthebrain/tag/wordpress/) by [Heather Urry](http://sites.tufts.edu/emotiononthebrain/author/hurry01/). Bookmark the [permalink](http://sites.tufts.edu/emotiononthebrain/2017/08/12/blog-posting-from-r-markdown-to-wordpress/).