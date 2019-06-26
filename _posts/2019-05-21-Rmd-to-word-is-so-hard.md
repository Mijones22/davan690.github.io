---
title: "Bookdown to word"
permalink: /bookdown-to-word.html
layout: post 
header:
  overlay_color: "444444"
tags: ["phd", "general", "overview", "website"]
---

Now this has been a huge barrier for me ever since I become aware of the ability to build reports well doing statistical coding in R. But over the past year it has become "somewhat possible" to do this in RMarkdown and connecting this to word using a series of packages.

Word has always been hard to work with big documents. In particular, if the user has large or numerous images, tables and equations. This makes something like LaTex or Markdown an appealing option but the barrier is:

**you have to learn the coding language!**

And "everyone says that all coding has a steep and un-enjoyable journey to the top."

The thing I was not expecting was for the communication and generation of word documents to be SOOOOO painful. *This has come in leaps and bounds over the past year or so thanks to a key group of developers (Hadley WIckham and YUi "the rockstar"!....and others).*

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

#### Other repositories

<div class="spacer"></div>
<div class="row text-center">
  <div class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center">
    <div class="project-card">
      {%- assign gh-user = "davan690"-%}
      {%- assign gh-project = "rmarkdown-workshop" -%}
      <a target="_blank" href="https://github.com/{{- gh-user -}}/{{- gh-project -}}" class="project-link" title="Go to Github Poject Page">
        <span class="fa-stack fa-4x">
          <i class="fa fa-circle fa-stack-2x stack-color"></i>
          <i class="fa fa-terminal fa-stack-1x fa-inverse"></i>
        </span>
        <h4>{{- gh-project -}}</h4>
        <hr class="seperator">
        <p class="text-muted">A collection of scripts, code and vignettes for doing research in ecology and general research. </p>
        <hr class="seperator">
        <img src="https://img.shields.io/github/forks/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Fork" alt="Github" title="Github Forks">
        <img src="https://img.shields.io/github/stars/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Stars" alt="Github" title="Github Stars">
      </a>
    </div>
  </div>
  <div class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center">
    <div class="project-card">
      {%- assign gh-project = "Manuscript_in_Rmarkdown" -%}
      <a target="_blank" href="https://github.com/{{- gh-user -}}/{{- gh-project -}}" class="project-link" title="Go to Github Poject Page">
        <span class="fa-stack fa-4x">
          <i class="fa fa-circle fa-stack-2x stack-color"></i>
          <i class="fa fa-file-code-o fa-stack-1x fa-inverse"></i>
        </span>
        <h4>{{- gh-project -}}</h4>
        <hr class="seperator">
        <p class="text-muted">Building on the British Ecological Society guidebook on reporducible code.</p>
        <hr class="seperator">
        <img src="https://img.shields.io/github/forks/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Fork" alt="Github" title="Github Forks">
        <img src="https://img.shields.io/github/stars/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Stars" alt="Github" title="Github Stars">
      </a>
    </div>
  </div>
  <div class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center">
    <div class="project-card">
    {%- assign gh-project = "rmdTemplates" -%}
      <a target="_blank" href="https://github.com/{{- gh-user -}}/{{- gh-project -}}" class="project-link" title="Go to Github Poject Page">
        <span class="fa-stack fa-4x">
          <i class="fa fa-circle fa-stack-2x stack-color"></i>
          <i class="fa fa-user-secret fa-stack-1x fa-inverse"></i>
        </span>
        <h4>{{- gh-project -}}</h4>
        <hr class="seperator">
        <p class="text-muted">The beginnings of a interactive PhD thesis using Markdown. </p>
        <hr class="seperator">
        <img src="https://img.shields.io/github/forks/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Fork" alt="Github" title="Github Forks">
        <img src="https://img.shields.io/github/stars/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Stars" alt="Github" title="Github Stars">
      </a>
    </div>
  </div>
  <div class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center">
    <div class="project-card">
    {%- assign gh-project = "rmarkdown2docx" -%}
      <a target="_blank" href="https://github.com/{{- gh-user -}}/{{- gh-project -}}" class="project-link" title="Go to Github Poject Page">
        <span class="fa-stack fa-4x">
          <i class="fa fa-circle fa-stack-2x stack-color"></i>
          <i class="fa fa-user-secret fa-stack-1x fa-inverse"></i>
        </span>
        <h4>{{- gh-project -}}</h4>
        <hr class="seperator">
        <p class="text-muted">The beginnings of a interactive PhD thesis using Markdown. </p>
        <hr class="seperator">
        <img src="https://img.shields.io/github/forks/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Fork" alt="Github" title="Github Forks">
        <img src="https://img.shields.io/github/stars/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Stars" alt="Github" title="Github Stars">
      </a>
    </div>
  </div>
</div>

## My notes

I’m really not sure how to start these notes but I am sure there will be many in time. For now they are just snippets of fleeting information.

### The YAML content

I did not realise how touching the `tabs` and spaces were in the `YAML` header of any `.Rmd` file.

### TIdy up R-code

The code rendered into a word document tends to be justified and messy. You can not just use the templating options of `bookdown` and `rmarkdown` as I tried and it didn’t seem to want to play ball.

## Cross referencing notes



FROM: https://stackoverflow.com/questions/52335126/cross-references-in-rmarkdown-for-word-documents

According to [the Rmarkdown guide](https://bookdown.org/yihui/bookdown/figures.html) by the creator @Yihui, `\@ref(figure's label)` should be used to refer to a figure. Therefore, you may use `\@ref(fig:TotalCarStock)`, instead of `\ref{fig:TotalCarStock}`, as shown below:

> As illustrated in Figure \@ref(fig:TotalCarStock), etc, etc.

The notation `\@ref(figure's/table's label)` can be used to make a reference to an image, graph or table, when knitting either `.docx`, `.pdf`, or `.html`.



[share](https://stackoverflow.com/a/52345023/10098854)[edit](https://stackoverflow.com/posts/52345023/edit)

[edited Sep 15 '18 at 19:21](https://stackoverflow.com/posts/52345023/revisions)





answered Sep 15 '18 at 13:10

[![img](https://lh3.googleusercontent.com/-bwcos_zylKg/AAAAAAAAAAI/AAAAAAAAAAA/AAnnY7o18NuEdWnDEck_qPpn-lu21VTdfw/mo/photo.jpg?sz=32)](https://stackoverflow.com/users/10215301/carlos-luis-rivera)

[Carlos Luis Rivera](https://stackoverflow.com/users/10215301/carlos-luis-rivera)

**302**1111 bronze badges

- 

  Actually, I had already tried to implement this. I then got the following output: "As illustrated in Figure @ref{fig:TotalCarStock}, the forecasted car stock is much higher than the actual car stock" – [Laurent Franckx](https://stackoverflow.com/users/2489272/laurent-franckx)[Sep 17 '18 at 9:54](https://stackoverflow.com/questions/52335126/cross-references-in-rmarkdown-for-word-documents#comment91674344_52345023) 

- 

  I oversaw a fundamental solution: your file path may need to be fixed. Currently, your file path is `C:/Usr/WP vehicle stock/TotalCarStock.jpg`, which includes some ` ` (spaces). That seems cause the problem. If possible, could you rename the path so that the file path has no space? (e.g. `C:/Usr/WP-vehicle-stock/TotalCarStock.jpg`) I think `-` (hyphen) is more convenient than `_` (underscore), because sometimes TeX engines fail to read a path with underscores. Although I know that you want a `.docx` output , using `-` is safer way as far as I know. – [Carlos Luis Rivera](https://stackoverflow.com/users/10215301/carlos-luis-rivera) [Sep 17 '18 at 10:50](https://stackoverflow.com/questions/52335126/cross-references-in-rmarkdown-for-word-documents#comment91676210_52345023) 



