---
layout: post
title: ""
subtitle: ""
image: /img/...
permlink: /first-post.html
tags: ["website", "overview", "general"]
bigimg: /img/...
use-site-title: true

---

```
#---
#title: "Beech forest dynamics"
#subtitle: "A simulation"
#author: "Anthony Davidson"
#date: '2019-05-16' 
#output: 
#  html_vignette:
#    theme: docco
#    # reference_docx: template2.docx
#bibliography: Beech-forests.bib
#---
```

## 3.4 A single document

Sometimes you may not want to write a book, but a single long-form article or report instead. Usually what you do is call `rmarkdown::render()` with a certain output format. The main features missing there are the automatic numbering of figures/tables/equations, and cross-referencing figures/tables/equations/sections. We have factored out these features from **bookdown**, so that you can use them without having to prepare a book of multiple Rmd files.

The functions `html_document2()`, `tufte_html2()`, `pdf_document2()`, `word_document2()`, `tufte_handout2()`, and `tufte_book2()` are designed for this purpose. If you render an R Markdown document with the output format, say, `bookdown::html_document2`, you will get figure/table numbers and be able to cross-reference them in the single HTML page using the syntax described in Chapter [2](https://bookdown.org/yihui/bookdown/components.html#components).

The above HTML and PDF output format functions are basically wrappers of output formats `bookdown::html_book` and `bookdown::pdf_book`, in the sense that they changed the `base_format`argument. For example, you can take a look at the source code of `pdf_document2`:

```
bookdown::pdf_document2
## function(...) {
##   pdf_book(..., base_format = rmarkdown::pdf_document)
## }
## <bytecode: 0x7fbbc0152120>
## <environment: namespace:bookdown>
```

After you know this fact, you can apply the same idea to other output formats by using the appropriate `base_format`. For example, you can port the **bookdown** features to the `jss_article` format in the **rticles** package (Allaire, Xie, R Foundation, et al. [2019](https://bookdown.org/yihui/bookdown/a-single-document.html#ref-R-rticles)) by using the YAML metadata:

```
output:
  bookdown::pdf_book:
    base_format: rticles::jss_article
```

Then you will be able to use all features we introduced in Chapter [2](https://bookdown.org/yihui/bookdown/components.html#components).

Although the `gitbook()` format was designed primarily for books, you can actually also apply it to a single R Markdown document. The only difference is that there will be no search button on the single page output, because you can simply use the searching tool of your web browser to find text (e.g., press `Ctrl + F` or `Command + F`). You may also want to set the option `split_by` to `none` to only generate a single output page, in which case there will not be any navigation buttons, since there are no other pages to navigate to. You can still generate multiple-page HTML files if you like. Another option you may want to use is `self_contained = TRUE` when it is only a single output page.

### References

Allaire, JJ, Yihui Xie, R Foundation, Hadley Wickham, Journal of Statistical Software, Ramnath Vaidyanathan, Association for Computing Machinery, et al. 2019. *Rticles: Article Formats for R Markdown*. [https://CRAN.R-project.org/package=rticles](https://cran.r-project.org/package=rticles).

