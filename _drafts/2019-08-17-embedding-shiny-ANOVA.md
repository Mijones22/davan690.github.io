---
layout: post
title: "Embedding a shiny app"
subtitle: "Using shiny apps deployed by others"
image: /img/tools.jpg
permlink: /shiny-anova.html
tags: ["website", "overview", "general"]
bigimg: /img/tools.jpg
use-site-title: true
---

The ANOVA DIY app from the Shiny showcase:

<iframe width="650" height="500" src="https://pecostats.shinyapps.io/DIY_ANOVA/"> </iframe>

## Resources

Original post [here](https://www.brettory.com/2018/02/embedding-a-shiny-app-in-blogdown/)

## My notes

Many of these sorts of apps can be found [here](https://grabear.github.io/awesome-rshiny/)

And below is my current repository forked from the above link.

<div class="spacer"></div>
<div class="row text-center">
    <div class="project-card">
      {%- assign gh-user = "davan690"-%}
      {%- assign gh-project = "awesome-rshiny" -%}
      <a target="_blank" href="https://github.com/{{- gh-user -}}/{{- gh-project -}}" class="project-link" title="Go to Github Poject Page">
        <span class="fa-stack fa-4x">
          <i class="fa fa-circle fa-stack-2x stack-color"></i>
          <i class="fa fa-terminal fa-stack-1x fa-inverse"></i>
        </span>
        <h4>{{- gh-project -}}</h4>
        <hr class="seperator">
        <p class="text-muted">A collection of shiny apps, scripts, code and vignettes for doing research in ecology and general research. </p>
        <hr class="seperator">
        <img src="https://img.shields.io/github/forks/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Fork" alt="Github" title="Github Forks">
        <img src="https://img.shields.io/github/stars/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Stars" alt="Github" title="Github Stars">
      </a>
  </div>