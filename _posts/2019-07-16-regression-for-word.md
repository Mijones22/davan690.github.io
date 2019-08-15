---
layout: post
title: "Regressions for word docx"
subtitle: "Tables and figures"
image: /img/tools.jpg
permlink: /regression-rendered-docx.html
tags: ["website", "overview", "general", "R", "tools", "docx"]
bigimg: /img/tools.jpg
use-site-title: true
---

This is where it gets tricky with RMarkdown. It doesn't like R.

## Resources

Here are some blogs on where this situation is:

- [A blog description of one option](https://datascienceplus.com/how-to-export-regression-results-from-r-to-ms-word/)

## My Notes

Copy and paste example below and go from there currently using the `survival` package examples.

1. Libraries needed

```{r}## Load survival packagelibrary(survival)```

### Load veteran data

```{r}data(veteran)```

### Data description

```{r}help(veteran, package="survival")```

### Show first 6 rows

```{r}head(veteran)```

### Fit the COX model

```{r}fit = coxph(Surv(time, status) ~ age + celltype + prior + karno + diagtime + trt, data=veteran)```

```{r}summary(fit)```

### Prepare the columns

```{r}HR <- round(exp(coef(fit)), 2); CI <- round(exp(confint(fit)), 2); P <- round(coef(summary(fit))[,5], 3)```

### Names the columns of CI

```{r}colnames(CI) <- c("Lower", "Higher"); # Bind columns together as dataset; table2 <- as.data.frame(cbind(HR, CI, P)); table2```

###  Select variables you want to present in table

```{r} table2 <- table2[c("celltypesmallcell","celltypeadeno","celltypelarge","trt"),]; table2```

### add brackes and line for later use in table

```{r}table2$a <- "("; table2$b <- "-"; table2$c <- ")"; #order the columns; table2 <- table2[,c("HR","a","Lower","b","Higher","c", "P")];table2```

### Merge all columns in one;library(tidyr)

```{r}table2 = unite(table2, "HR (95%CI)", c(HR, a, Lower, b, Higher, c), sep = "", remove=T);# add space between the estimates of HR and CI;table2[,1] <- gsub("\\(", " (", table2[,1]);table2```

### Load the packages

```{r}library(ReporteRs); library(magrittr); # The script;docx( ) %>% addFlexTable(table2 %>% FlexTable(header.cell.props = cellProperties( background.color = "#003366"), eader.text.props = textBold(color = "white"),           add.rownames = TRUE ) %>% etZebraStyle(odd = "#DDDDDD", even = "#FFFFFF")) %>% writeDoc(file = "table2.docx")```