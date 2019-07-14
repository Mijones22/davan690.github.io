---
layout: post
title: "Shiny basics"
subtitle: "A collection of resources for shiny apps in RStudio"
use-site-title: true
---

[<img src="https://www.rstudio.com/wp-content/uploads/2014/04/shiny.png" align="right" width="100">](https://www.rstudio.com)Running shiny examples and a simple code to start it all going in  [RStudio](https://shiny.rstudio.com).

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

