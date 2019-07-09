---
layout: post
title: "What is a Vignette?"
subtitle: "Long-form documentation"
use-site-title: true

---

# FROM: http://r-pkgs.had.co.nz/vignettes.html



More RMarkdown

https://r4ds.had.co.nz/r-markdown-formats.html

# Vignettes: long-form documentation

A vignette is a long-form guide to your package. Function documentation is great if you know the name of the function you need, but it’s useless otherwise. A vignette is like a book chapter or an academic paper: it can describe the problem that your package is designed to solve, and then show the reader how to solve it. A vignette should divide functions into useful categories, and demonstrate how to coordinate multiple functions to solve problems. Vignettes are also useful if you want to explain the details of your package. For example, if you have implemented a complex statistical algorithm, you might want to describe all the details in a vignette so that users of your package can understand what’s going on under the hood, and be confident that you’ve implemented the algorithm correctly.

Many existing packages have vignettes. You can see all the installed vignettes with `browseVignettes()`. To see the vignette for a specific package, use the argument, `browseVignettes("packagename")`. Each vignette provides three things: the original source file, a readable HTML page or PDF, and a file of R code. You can read a specific vignette with `vignette(x)`, and see its code with `edit(vignette(x))`. To see vignettes for a package you haven’t installed, look at its CRAN page, e.g., http://cran.r-project.org/web/packages/dplyr.

Before R 3.0.0, the only way to create a vignette was with Sweave. This was challenging because Sweave only worked with LaTeX, and LaTeX is both hard to learn and slow to compile. Now, any package can provide a vignette **engine**, a standard interface for turning input files into HTML or PDF vignettes. In this chapter, we’re going to use the R markdown vignette engine provided by [knitr](http://yihui.name/knitr/). I recommend this engine because:

- You write in Markdown, a plain text formatting system. Markdown is limited compared to LaTeX, but this limitation is good because it forces you to focus on the content.
- It can intermingle text, code and results (both textual and visual).
- Your life is further simplified by the [rmarkdown package](http://rmarkdown.rstudio.com/), which coordinates Markdown and knitr by using [pandoc](http://johnmacfarlane.net/pandoc) to convert Markdown to HTML and by providing many useful templates.

Switching from Sweave to R Markdown had a profound impact on my use of vignettes. Previously, making a vignette was painful and slow and I rarely did it. Now, vignettes are an essential part of my packages. I use them whenever I need to explain a complex topic, or to show how to solve a problem with multiple steps.

Currently, the easiest way to get R Markdown is to use [RStudio](http://www.rstudio.com/products/rstudio/download/preview/). RStudio will automatically install all of the needed prerequisites. If you don’t use RStudio, you’ll need to:

1. Install the rmarkdown package with `install.packages("rmarkdown")`.
2. [Install pandoc](http://johnmacfarlane.net/pandoc/installing.html).

## Vignette workflow

To create your first vignette, run:

```
devtools::use_vignette("my-vignette")
```

This will:

1. Create a `vignettes/` directory.
2. Add the necessary dependencies to `DESCRIPTION` (i.e. it adds knitr to the `Suggests` and `VignetteBuilder` fields).
3. Draft a vignette, `vignettes/my-vignette.Rmd`.

The draft vignette has been designed to remind you of the important parts of an R Markdown file. It serves as a useful reference when you’re creating a new vignette.

Once you have this file, the workflow is straightforward:

1. Modify the vignette.
2. Press Ctrl/Cmd + Shift + K (or click ![img](http://r-pkgs.had.co.nz/screenshots/knit.png)) to knit the vignette and preview the output.

There are three important components to an R Markdown vignette:

- The initial metadata block.
- Markdown for formatting text.
- Knitr for intermingling text, code and results.

These are described in the following sections.

## Metadata

The first few lines of the vignette contain important metadata. The default template contains the following information:

```
---
title: "Vignette Title"
author: "Vignette Author"
date: "`r Sys.Date()`"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Vignette Title}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---
```

This metadata is written in [yaml](http://www.yaml.org/), a format designed to be both human and computer readable. The basics of the syntax is much like the `DESCRIPTION` file, where each line consists of a field name, a colon, then the value of the field. The one special YAML feature we’re using here is `>`. It indicates the following lines of text are plain text and shouldn’t use any special YAML features.

The fields are:

- Title, author and date: this is where you put the vignette’s title, author and date. You’ll want to fill these in yourself (you can delete them if you don’t want the title block at the top of the page). The date is filled in by default: it uses a special knitr syntax (explained below) to insert today’s date.
- Output: this tells rmarkdown which output formatter to use. There are many options that are useful for regular reports (including html, pdf, slideshows, …) but `rmarkdown::html_vignette` has been specifically designed to work well inside packages. See `?rmarkdown::html_vignette` for more details.
- Vignette: this contains a special block of metadata needed by R. Here, you can see the legacy of LaTeX vignettes: the metadata looks like LaTeX commands. You’ll need to modify the `\VignetteIndexEntry` to provide the title of your vignette as you’d like it to appear in the vignette index. Leave the other two lines as is. They tell R to use `knitr` to process the file, and that the file is encoded in UTF-8 (the only encoding you should ever use to write vignettes).

