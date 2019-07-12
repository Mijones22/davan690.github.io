---
layout: post
title: "Shiny starting"
subtitle: "A collection of resources for the first steps of Shiny apps"
use-site-title: true
---

Shiny is exactly that currently. Its a shiny place to be. Here is the resources I am working from to intergrate shiny within this website.  Descover shiny [here](https://www.rstudio.com/products/shiny/)

[video](https://vimeo.com/97466638)

[Dean](https://deanattali.com/blog/building-shiny-apps-tutorial/) (who has build the template for this website) has a tutorial on this and you can even hire him [here](https://deanattali.com/shiny/) if you need any more done. I have just been teaching myself with the resources below by extending his tutorial with my own personal notes.

## Resources

### Blogs

Jake's short guide [here](https://www.jakeruss.com/cheatsheets/stargazer/#quick-notes) but here are some extra ones I havent looked at in as much detail:

- Psych shiny [here](https://psyr.org/shiny.html)
- General medium [blog on simple shiny](https://medium.com/@maloojinesh/shiny-for-beginners-780ce6a56846)
- RStudio’s basic vignette [here](https://shiny.rstudio.com/articles/basics.html)

### Videos/media content

- Youtube video on the [matter](https://www.youtube.com/watch?v=M7ywRJjt4Ko)

### Shiny gallery

<div class="spacer"></div>
<div class="row text-center">
  <div class="col-md-4 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center">
    <div class="project-card">
      {%- assign gh-user = "davan690"-%}
      {%- assign gh-project = "shiny-examples" -%}
      <a target="_blank" href="https://github.com/{{- gh-user -}}/{{- gh-project -}}" class="project-link" title="Go to Github Project Page">
        <span class="fa-stack fa-4x">
          <i class="fa fa-circle fa-stack-2x stack-color"></i>
          <i class="fa fa-terminal fa-stack-1x fa-inverse"></i>
        </span>
        <h4>{{- gh-project -}}</h4>
        <hr class="seperator">
        <p class="text-muted">A collection of scripts, code and vignettes for building shiny apps. </p>
        <hr class="seperator">
        <img src="https://img.shields.io/github/forks/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Fork" alt="Github" title="Github Forks">
        <img src="https://img.shields.io/github/stars/{{- gh-user -}}/{{- gh-project -}}.svg?style=social&label=Stars" alt="Github" title="Github Stars">
      </a>
    </div>
  </div>

#### Other repos

- https://github.com/davan690/awesome-shiny-extensions
- https://github.com/davan690/awesome-rshiny

#### RStudio examples I like

- http://shiny.rstudio.com/gallery/superzip-example.html
- 

## Tutorials

Running shiny examples:

- Shiny from [RStudio](https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/)
- New advances in shiny [talk](https://vimeo.com/94184686)

### Shiny structure

Shiny apps are contained in a single script called app.R. The script `app.R` lives in a directory (for example, newdir/) and the app can be run with `runApp("newdir")`. `app.R` has three components:

- a user interface object
- a server function
- a call to the shinyApp function


```{r}
install.packages("shiny")
library(shiny)
runExample("01_hello")
```

## My extended notes from Deans tutorial

For the most part the aim of this work is to produce some simple comparisons between groups of samples after accounting for the bias and other estimation issues. I will do this with the examples below:

