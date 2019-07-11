---
layout: post
title: "Shiny basics"
subtitle: "A collection of resources for shiny apps in RStudio"
use-site-title: true
---

Shiny is exactly that currently. Its a shiny place to be. Here is the resources I am working from to intergrate shiny within this website. 

[Dean](https://deanattali.com/blog/building-shiny-apps-tutorial/) (who has build the template for this website) has a tutorial on this and you can even hire him [here](https://deanattali.com/shiny/) if you need any more done. I have just been teaching myself with the resources below by extending his tutorial with my own personal notes.

## Resources

A strong publication maybe; decide for yourself [here](https://escholarship.org/uc/item/00d4q8cp)

### Blogs

Jake's short guide [here](https://www.jakeruss.com/cheatsheets/stargazer/#quick-notes) but here are some extra ones I havent looked at in as much detail:

- Psych shiny [here](https://psyr.org/shiny.html)
- General medium [blog on simple shiny](https://medium.com/@maloojinesh/shiny-for-beginners-780ce6a56846)
    - https://towardsdatascience.com/get-started-with-examples-of-reactivity-in-in-shiny-apps-db409079dd11
- RStudio’s basic vignette [here](https://shiny.rstudio.com/articles/basics.html)
- Calpoly collection of shiny apps {here}(https://statistics.calpoly.edu/shiny#chaos2d)
    - https://statistics.calpoly.edu/shiny#chaos2d
    - http://shiny.calpoly.sh/MLE_Binomial/
    - http://shiny.calpoly.sh/Prob_View/
    - http://shiny.calpoly.sh/RandVarGen/
    - https://calpolystat3.shinyapps.io/Hierarchical_Models/
    - https://maps.calpoly.edu/place/bldg-122-V/@35.3075809,-120.6991072,12.9z

### Videos/media content

- Youtube video on the [matter](https://www.youtube.com/watch?v=M7ywRJjt4Ko)
- 41min tutorial from RStudio [here](https://www.rstudio.com/resources/webinars/how-to-start-with-shiny-part-1/)

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

For the most part the aim of this work is to produce some simple comparisons between groups of samples after accounting for the bias and other estimation issues. I will do this with the examples below:

