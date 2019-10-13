---
title: "Bookdown"
subtitle: "Rocks!"
type: post
image: /img/wr-webpage.png
bigimg: /img/first-image1.png
tags: ["markdown", "website", "tools", "rmd"]
permalink: /bookdown1.html
---

`bookdown` is an amazing conglomerate of packages using `r`. This is a collection of my resources and notes on building a `bookdown` project into a manuscript.

## Resources

There are quite a few blogs around that explain how to make a single page output from a bookdown project.

## My notes

Thankfully the star and creator of the `rmarkdown` world thought of this and by using the following script it is possible to turn a dynamic book into a single word document.

```{r echo = TRUE}
#---
#title:
#subtitle:
#output:
#   rmarkdown::word_document2:
#       reference_docx: template3
#---
```

After this renders it is possible to modify the content that is rendered in the `_bookdown.yaml` file.

```{r echo = TRUE}
#book_filename: "New Zealand #Beech Forest Dynamics"
#language:
#  ui:
#    chapter_name: "Chapter "
#delete_merged_file: true
```

The chapters that are or are not included in the single document can be defined as so:

```{r echo = TRUE}
#rmd_files: ["index.Rmd","00-Status.Rmd", "01-intro.Rmd","03-Material-and-methods.Rmd","04-Results.Rmd","05-Discussion.Rmd", "07-references.Rmd"]
```

The gitrepo associated with it:

```{r echo = TRUE}
#repo: https://github.com/{% git-user %}
```

And the output location:

```{r echo = TRUE}
#output_dir: docs
```
And the overall configuration is defined by the `_output.yaml` as below.

```{r echo = TRUE}
#bookdown::gitbook:
#  css: style.css
#  config:
#    toc:
#      before: |
#        <li><a href="./">A simple template for projects</a></li>
#      after: |
#        <li><a href="https://github.com/davan690/beech-forest-publication" target="blank">Published with bookdown</a></li>
#    edit: https://github.com/davan690/beech-forest-publication/docs/%s
#    download: ["pdf", "epub", "mobi", "docx"]
#bookdown::pdf_book:
#  includes:
#    in_header: preamble.tex
#  latex_engine: xelatex
#  citation_package: natbib
#  keep_tex: yes
#bookdown::epub_book: default
#bookdown::word_document2:
#  reference_docx: template3.docx
```

