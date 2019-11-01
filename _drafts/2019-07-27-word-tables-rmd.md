---
title: "Tables in Word documents"
layout: post
subtitle: "Finding a solution"
image: /img/tools.jpg
permlink: /tables-word-docs.html
tags: ["website", "overview", "general"]
bigimg: /img/tools.jpg
use-site-title: true
---

![1565176985620](../../img/word-table-issues.jpg)

This is tricky buut my simple workflow and packages are below.

## Resources

- `compareGroups`

- `tidyverse`

- `DT`

- `plotly`

- `car`

- `kable`

  

## My notes

For a simple anova or glm output table in word.

1. ```R
   #low.mod4 <- glm(log(N) ~ Control + Valley + Conditions + Control:Conditions, family = "gaussian", data = low.abund.dat)
   ```

2. ```R
   #summary.low.mod4 <- summary(low.mod4)
   ```

3. ```R
   #low.mod4.fun <- anova(low.mod4, test = "F") 
   ```

4. ```R
   #kable(signif(summary.low.mod4$coefficients,2),format = "markdown")
   ```

5. And then it is up to personal choice as to how you want to style the document by using:

   ​	- 

