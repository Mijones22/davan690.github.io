---
title: "Bookdown to word"
permalink: /bookdown-to-word.html
layout: post 
header:
  overlay_color: "444444"
tags: ["phd", "general", "overview", "website"]
---

Now this has been a huge barrier for me ever since I become aware of the ability to build reports well doing statistical coding in R. But over the past year it has become "somewhat possible" to do this in RMarkdown.

Word has always been hard to work with big documents and large numbers of images and equations makes something like LaTex or Markdown an appealing option but then you have to learn the coding language and that is a steep and often un-enjoyable journey to the top.

The thing I was not expecting was for the communication and generation of word documents to be SOOOOO painful. *This has come in leaps and bounds over the past year or so thanks to a key group of developers (Haldey etc).* 

Here are a few short notes on the issues I found hard in the `docx` world.

## DOCx code!

| CODE                       | MEANING |
| -------------------------- | ------- |
| `bookdown::word_document2` |         |
| `rmarkdown::word_document` |         |
| `rmarkdown::render`        |         |
| `servr::serve.jekyll?`     |         |

## Tutorials

- [RStudio guide again](https://rmarkdown.rstudio.com/articles_docx.html)
- [Cross-referencing](https://stackoverflow.com/questions/52335126/cross-references-in-rmarkdown-for-word-documents): This is just a stack-overflow feed but has some handy code snippets inside.
- 

## My notes

I’m really not sure how to start these notes but I am sure there will be many in time. For now they are just snippets of fleeting information.

### The YAML content

I did not realise how touching the `tabs` and spaces were in the `YAML` header of any `.Rmd` file.

### TIdy up R-code

The code rendered into a word document tends to be justified and messy. You can not just use the templating options of `bookdown` and `rmarkdown` as I tried and it didn’t seem to want to play ball.



