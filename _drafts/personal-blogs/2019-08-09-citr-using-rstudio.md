---
title: "Bibtex and citr add-in using RStudio"
layout: post
subtitle: "A quick hack"
image: /img/tools.jpg
permlink: /citr1-error-bib.html
tags: ["website", "overview", "general"]
bigimg: /img/tools.jpg
use-site-title: true
---

Referencing in R analysis can be tricky. There are a few different options and styles that can be used even before all the standard issues with styles and journals come about. One good option in `RStudio` is to use the `citr` package and the add-on associated.

![1565090897567](../../img/citr-r-addins.png)

![1565091802854](../../img/extra-citr-bib-files.png)

## Resources

```html
<div class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center">
    <div class="project-card">
        {%- assign gh-project = "citr" -%}
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
```



## My notes

