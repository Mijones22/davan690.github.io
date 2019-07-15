---
layout: post
title: "Regressions for word docx"
subtitle: "Tables and figures"
use-site-title: true
comments: true
---

Here are some blogs on where this situation is:

- [A blog description of one option](https://datascienceplus.com/how-to-export-regression-results-from-r-to-ms-word/)
 

### Cheatsheet  steps

Copy and paste example below and go from there:

```{r}## Load survival package
library(survival)
# Load veteran data
data(veteran)
# Data description
help(veteran, package="survival")
# Show first 6 rows
head(veteran)
```

```ruby
{% for post in site.tags["shiny"] %} [{{ post.title }}](https://github.com/davan690/beech-forest-dynamics/blob/master/{{ post.url }}) ({{ post.date | date_to_string }})
{{ post.description }} {% endfor %}
```

```{r}# Fit the COX model
fit = coxph(Surv(time, status) ~ age + celltype + prior + karno + diagtime + trt, data=veteran)
```

```R
summary(fit)
```

```R
# Prepare the columns
HR <- round(exp(coef(fit)), 2)
CI <- round(exp(confint(fit)), 2)
P <- round(coef(summary(fit))[,5], 3)
# Names the columns of CI
colnames(CI) <- c("Lower", "Higher")
# Bind columns together as dataset
table2 <- as.data.frame(cbind(HR, CI, P))
table2
```

```R
# select variables you want to present in table
table2 <- table2[c("celltypesmallcell","celltypeadeno","celltypelarge","trt"),]
table2
```

```R
# add brackes and line for later use in table
table2$a <- "("; table2$b <- "-"; table2$c <- ")"

# order the columns
table2 <- table2[,c("HR","a","Lower","b","Higher","c", "P")]
table2
```

```R
# Merge all columns in one
library(tidyr)
table2 = unite(table2, "HR (95%CI)", c(HR, a, Lower, b, Higher, c), sep = "", remove=T)
# add space between the estimates of HR and CI
table2[,1] <- gsub("\\(", " (", table2[,1])
table2
```

```R
# Load the packages
library(ReporteRs)
library(magrittr)
# The script
docx( ) %>% 
     addFlexTable(table2 %>%
               FlexTable(header.cell.props = cellProperties( background.color = "#003366"),
                    header.text.props = textBold(color = "white"),
                    add.rownames = TRUE ) %>%
               setZebraStyle(odd = "#DDDDDD", even = "#FFFFFF")) %>%
     writeDoc(file = "table2.docx")
```