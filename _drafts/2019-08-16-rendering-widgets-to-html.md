---
title: "Rendering shiny and RMarkdown to website"
layout: post
subtitle: "Tricky"
image: /img/tools.jpg
permlink: /first-post.html
tags: ["website", "overview", "general"]
bigimg: /img/tools.jpg
use-site-title: true
---

Html-widgets for R explained

<iframe width="560" height="315" src="https://www.youtube.com/embed/dV4gtARPvu8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## My notes

[From here](https://stackoverflow.com/questions/56157839/rendering-html-outputs-from-r-markdown-in-shiny-app): Rendering HTML documents in a `ShinyApp`

This is pretty straightforward, all you need to do is use `includeHTML` in your `UI.R` portion of your ShinyApp, no server side component is required.

http://shiny.rstudio.com/gallery/including-html-text-and-markdown-files.html

**Note:** `includeHTML` does not render your `*.Rmd` file.

> 1. Rendering a .Rmd file in a `ShinyApp`

This requires `knit` and `markdownToHTML`, see the below thread.

[RMarkdown in Shiny Application](https://stackoverflow.com/questions/33499651/rmarkdown-in-shiny-application)

------

### Example Pieces of Code

**Example .Rmd file**

```r
---
title: "An example Knitr/R Markdown document"
output: html_document
---


{r chunk_name, include=FALSE}
x <- rnorm(100)
y <- 2*x + rnorm(100)
cor(x, y)
{r scatterplot, fig.width=8, fig.height=6}
plot(x,y)
```

> Above saved as: `test_presentation.Rmd` and `knit` as a `test_presentation.html`

**1. Include the HMTL file in Shiny**

```r
library(shiny)

ui <- shinyUI(
  fluidPage(
    includeHTML('test_presentation.html')
  )
)
server <- function(input, output) {
}

shinyApp(ui, server)
```

**2. Render the above \*.Rmd file in Shiny**

Code taken form: https://stackoverflow.com/a/33500524/5996972

```r
library(shiny)
library(knitr)

ui <- shinyUI(
  fluidPage(
    uiOutput('markdown')
  )
)
server <- function(input, output) {
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit('test_presentation.rmd', quiet = TRUE)))
  })
}

shinyApp(ui, server)
```