---
layout: post
title: "A set of simple shiny scripts for creating a shiny app"
subtitle: "Create a figure..."
image: /img/tools.jpg
permlink: /simple-shiny-app.html
tags: ["website", "overview", "general", "R", "tools", "shiny"]
bigimg: /img/tools.jpg
use-site-title: true
---

As I am working through learning shiny I have created this blog to start from basics.

1. a `user interface` object
2. a `server` function
3. a call to the `shinyApp` function

### Libraries

```
library("shiny")
library("highcharter")
```

### `user interface` object

```
ui <- shinyUI(
  fluidPage(
    column(width = 8, highchartOutput("hcontainer", height = "500px")),
    column(width = 4, textOutput("text"))
  )
)
```


### `server` function

```
server <- function(input, output) {

  a <- data.frame(b = LETTERS[1:10], c = 11:20, d = 21:30, e = 31:40)

  output$hcontainer <- renderHighchart({

    canvasClickFunction <- JS("function(event) {Shiny.onInputChange('canvasClicked', [this.name, event.point.category]);}")
    legendClickFunction <- JS("function(event) {Shiny.onInputChange('legendClicked', this.name);}")

    highchart() %>%
      hc_xAxis(categories = a$b) %>%
      hc_add_series(name = "c", data = a$c) %>%
      hc_add_series(name = "d", data = a$d) %>%
      hc_add_series(name = "e", data = a$e) %>%
      hc_plotOptions(series = list(stacking = FALSE, events = list(click = canvasClickFunction, legendItemClick = legendClickFunction))) %>%
      hc_chart(type = "column")

  })

  makeReactiveBinding("outputText")

  observeEvent(input$canvasClicked, {
    outputText <<- paste0("You clicked on series ", input$canvasClicked[1], " and the bar you clicked was from category ", input$canvasClicked[2], ".")
  })

  observeEvent(input$legendClicked, {
    outputText <<- paste0("You clicked into the legend and selected series ", input$legendClicked, ".")
  })

  output$text <- renderText({
    outputText
  })
}
```

###  call to the `shinyApp` function

```
shinyApp(ui, server)
```

run app `runApp(ui.R, server.R)

## Resources

For something like `leafly` maps with shiny app [here](http://shiny.rstudio.com/deploy/)

- [Rstudio tools](http://shiny.rstudio.com/deploy/)

Full script below:

```
library("shiny")
library("highcharter")

ui <- shinyUI(
  fluidPage(
    column(width = 8, highchartOutput("hcontainer", height = "500px")),
    column(width = 4, textOutput("text"))
  )
)

server <- function(input, output) {

  a <- data.frame(b = LETTERS[1:10], c = 11:20, d = 21:30, e = 31:40)

  output$hcontainer <- renderHighchart({

    canvasClickFunction <- JS("function(event) {Shiny.onInputChange('canvasClicked', [this.name, event.point.category]);}")
    legendClickFunction <- JS("function(event) {Shiny.onInputChange('legendClicked', this.name);}")

    highchart() %>%
      hc_xAxis(categories = a$b) %>%
      hc_add_series(name = "c", data = a$c) %>%
      hc_add_series(name = "d", data = a$d) %>%
      hc_add_series(name = "e", data = a$e) %>%
      hc_plotOptions(series = list(stacking = FALSE, events = list(click = canvasClickFunction, legendItemClick = legendClickFunction))) %>%
      hc_chart(type = "column")

  })

  makeReactiveBinding("outputText")

  observeEvent(input$canvasClicked, {
    outputText <<- paste0("You clicked on series ", input$canvasClicked[1], " and the bar you clicked was from category ", input$canvasClicked[2], ".")
  })

  observeEvent(input$legendClicked, {
    outputText <<- paste0("You clicked into the legend and selected series ", input$legendClicked, ".")
  })

  output$text <- renderText({
    outputText
  })
}

shinyApp(ui, server)
```