---
title: "Comparing Groups"
subtitle: "A interface for creating summary tables"
permalink: /compare-groups-package.html
layout: post
tags: ["phd", "general", "overview", "website"]
image: /img/compareGroups-gui-shot.jpg
---

Taking a raw dataset and modifying the data to be able to present simple summary statistics can be challenging in R because often researchers that are working with the data only need to write the code to understand the process they are expecting to see. However, often it is these statistics that will provide the hints and support needed from other collaborators.

There are now a series of packages that can do much of this relatively short code snippets. Here I layout some of these packages and some quick cheat code to get through this process quickly.

## A list of packages that my be helpful

```{r }
# arsenal
# qwraps2
# amisc
# table1
# tangram
# furniture
# table-one
# compareGroups
# htmltable
```

## `comparegroups` package

### FOr example:

```{r }
library(tidyverse)
library(gapminder)
data(gapminder)

median_gdp <- median(gapminder$gdpPercap)
gapminder %>%
  select(-country) %>%
  mutate(gdpPercap = ifelse(gdpPercap > median_gdp, "high", "low")) %>%
  mutate(gdpPercap = factor(gdpPercap)) %>%
  mutate(pop = pop / 1000000) -> gapminder

gapminder <- lapply(gapminder, function(x) x[sample(c(TRUE, NA),
    prob = c(0.9, 0.1),
    size = length(x),
    replace = TRUE
  )])
```

```1 Introduction
The compareGroups package (Subirana, Sanz, and Vila 2014) allows users to create tables displaying results of univariate analyses, stratified or not by categorical variable groupings.```

```Tables can easily be exported to CSV, LaTeX, HTML, PDF, Word or Excel, or inserted in R-markdown files to generate reports automatically.```

```This package can be used from the R prompt or from a user-friendly graphical user interface for non-R familiarized users.```

```The compareGroups package is available on CRAN repository. To load the package using the R prompt, enter:"```

```library(compareGroups)```

![image](/img/compareGroups-gui-shot.jpg)

## Tutorials

There is a very good vignette for this package [here]("https://cran.r-project.org/web/packages/compareGroups/vignettes/compareGroups_vignette.html#launch-the-wui-application").

I have developed this slightly in my notes as function used for quick descriptive statistics using R and a GUI. For now these notes are on this page. At some stage I plan to move these to there own repository.

## My notes

Here I will put examples of using this package as it may be helpful for future projects.