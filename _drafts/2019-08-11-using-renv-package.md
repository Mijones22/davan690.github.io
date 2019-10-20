---
layout: post
title: Sorting out packages in R
subtitle: Another package to make package dependencies known
image: /img/renv-tools-snip.png
permlink: /sorting-package-uses.html
tags:
  - website
  - overview
  - general
bigimg: /img/tools.jpg
use-site-title: true
published: true
---

Here is an easy overview of the `renv` version package from [here](https://rstudio.github.io/renv/index.html)

![1565514375976](./img/renv-tools-snip.png)

This package is a quick solution to understand what packages a user needs to compile and analysis the r script you send them. This is a way of keeping that information in the file when you send the document.

## Resources

Creating reproducible working enviorments is something I am slowing working towards. Here are some blogs about it.

- [enviroments](https://environments.rstudio.com/)

## My notes

If you want one file to keep track of version and package changes the `renv` package from github can do it easily.

1. Download the package:

```R
if (!requireNamespace("remotes"))
  install.packages("remotes")

remotes::install_github("rstudio/renv")
```

2. Create a new file called  `renv.lock`

- using the function `renv::init()`

3. Then restore the package information when needed

- with `renv::restore()`
