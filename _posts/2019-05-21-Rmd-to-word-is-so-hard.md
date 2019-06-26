---
title: "Bookdown to word"
permalink: /bookdown-to-word.html
layout: post 
header:
  overlay_color: "444444"
tags: ["phd", "general", "overview", "website"]
---

Now this has been a huge barrier for me ever since I started doing statistical coding in R just over 10 years ago. Word has always been hard to work with big documents and large numbers of images and equations makes something like LaTex or Markdown an appealing option but then you have to learn the coding language and that is a steep and often un-enjoyable journey to the top.

But over the past year it has become "somewhat possible" to do this in RMarkdown.

The thing I was not expecting was for the communication and generation of word documents to be SOOOOO painful. This has come in leaps and bounds over the past year or so thanks to a key group of developers (Haldey etc). Here are a few short notes on the issues I found hard in the `docx` world.

## DOCx fun!

- `bookdown::word_document2`
- `rmarkdown::word_document`
- `rmarkdown::render`
- `servr::serve.jekyll?`

## Tutorials

- [RStudio guide again](https://rmarkdown.rstudio.com/articles_docx.html)
- [Cross-referencing](https://stackoverflow.com/questions/52335126/cross-references-in-rmarkdown-for-word-documents)

## My notes