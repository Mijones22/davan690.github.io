---
title: "Building bookdown outputs"
subtitle: "What is it all about?"
layout: post
permalink: word-to-rmd.html
image: /img/tools.jpg
bigimg: /img/tools.jpg
tags: ["website", "overview", "general"]
use-site-title: true
---

There are two blogs about this. One here going from `wordpress` to `jekyll` static site. The other one is goes the other way (for all the wordpress users out there). 

I investigated these resources last year when I was trying to work with `wordpress` and `RStudio` to write blogs. I thought this might be helpful for future reference.

## From WordPress

From our experience, the best way to import WordPress blog posts to Hugo is to import them to Jekyll, and write an R script to clean up the YAML metadata of all pages if necessary, instead of using the migration tools listed on the [official guide,](https://gohugo.io/tools/) including the WordPress plugin ` wordpress-to-hugo-exporter `.

To our knowledge, the best tool to convert a WordPress website to Jekyll is the Python tool [Exitwp.](https://github.com/thomasf/exitwp) Its author has provided detailed instructions on how to use it. You have to know how to install Python libraries and execute Python scripts. If you do not, I have provided an online tool at https://github.com/yihui/travis-exitwp. You can upload your WordPress XML file there, and get a download link to a ZIP archive that contains your posts in Markdown.

The biggest challenge in converting WordPress posts to Hugo is to clean up the post content in Markdown. Fortunately, I have done this for three different WordPress blogs,[41](https://bookdown.org/yihui/blogdown/from-wordpress.html#fn41) and I think I have managed to automate this process as much as possible. You may refer to the pull request I submitted to Karl Broman to convert his WordPress posts to Markdown (https://github.com/kbroman/oldblog_xml/pull/1), in which I provided both the R script and the Markdown files. I recommend that you go to the “Commits” tab and view all my GIT commits one by one to see the full process.

The key is the R script https://github.com/yihui/oldblog_xml/blob/master/convert.R, which converts the WordPress XML file to Markdown posts and cleans them. Before you run this script on your XML file, you have to adjust a few parameters, such as the XML filename, your old WordPress site’s URL, and your new blog’s URL.

Note that this script depends on the Exitwp tool. If you do not know how to run Exitwp, please use the online tool I mentioned before (travis-exitwp), and skip the R code that calls Exitwp.

The Markdown posts should be fairly clean after the conversion, but there may be remaining HTML tags in your posts, such as ` <table> ` and ` <blockquote> `. You will need to manually clean them, if any exist.

* * *

1. The RViews blog ([https://rviews.rstudio.com](https://rviews.rstudio.com/)), the RStudio blog ([https://blog.rstudio.com](https://blog.rstudio.com/)), and Karl Broman’s blog ([http://kbroman.org](http://kbroman.org/)). The RViews blog took me a few days. The RStudio blog took me one day. Karl Broman’s blog took me an hour.[↩](https://bookdown.org/yihui/blogdown/from-wordpress.html#fnref41)