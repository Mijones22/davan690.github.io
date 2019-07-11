---
layout: post
title: "Shiny basics"
subtitle: "A collection of resources for shiny apps in RStudio"
use-site-title: true
---

Shiny is exactly that currently. Its a shiny place to be. Here is the resources I am working from to intergrate shiny within this website. 

[Dean](https://deanattali.com/blog/building-shiny-apps-tutorial/) has a tutorial on this and is available to hire [here](https://deanattali.com/shiny/) if you need any more done. I have just teaching myself below by extending his tutorial with my own personal notes below.

The [Stargazer](https://cran.r-project.org/web/packages/stargazer/stargazer.pdf) package for R provides a way to create publication quality tables, and a way for researchers
to avoid creating new tables each time they tweak their dataset. This package saves users time, and has
been welcomed by the R community. It outputs tables in multiple formats; from .txt to LaTex code as well
as .html. 

This tutorial will go through the .txt and .html formats and provide the basic understanding needed to create Summary Statistics Tables and Regression Tables.

## Resources

### Blogs

Jake's short guide [here](https://www.jakeruss.com/cheatsheets/stargazer/#quick-notes)

### Videos

- Youtube video on the [matter](https://www.youtube.com/watch?v=M7ywRJjt4Ko)

## Tutorials

Running shiny examples:

- Shiny from [RStudio](https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/)

```{r}
install.packages("shiny")
library(shiny)
runExample("01_hello")
```

### Shiny structure

Shiny apps are contained in a single script called app.R. The script `app.R` lives in a directory (for example, newdir/) and the app can be run with `runApp("newdir")`. `app.R` has three components:

- a user interface object
- a server function
- a call to the shinyApp function

## My extended notes from Deans tutorial

