```
layout: post
title: "Another win for the rmd world"
subtitle: "Word template for WR journal"
image: /img/tools.jpg
permlink: /ms-template-doc.html
tags: ["website", "overview", "general"]
bigimg: /img/tools.jpg
use-site-title: true
```

Here is a manuscript template for `rmd` compiling using the following `yaml` header in the `-output.yaml` file of a bookdown project.

```
bookdown::gitbook:
  css: style.css
  config:
    toc:
      before: |
        <li><a href="./">New Zealand Beech Forest Dynamics</a></li>
      after: |
        <li><a href="https://github.com/davan690/beech-forest-publication" target="blank">Published with bookdown</a></li>
    edit: https://github.com/davan690/beech-forest-publication/edit/master/%s
    download: ["pdf", "epub", "mobi", "docx"]
bookdown::pdf_book:
  includes:
    in_header: preamble.tex
  latex_engine: xelatex
  citation_package: natbib
  keep_tex: yes
bookdown::epub_book: default
bookdown::word_document2:
  reference_docx: ms.docx
```

## Resources

An amazing blog on the matters and easy downloadable templates like here. Cheers to the [stirling coding club](https://stirlingcodingclub.github.io/Manuscripts_in_Rmarkdown/Rmarkdown_notes.html)
<br>
And the amazing developer of `rmd` ofcourse with the book [here](https://bookdown.org/yihui/rmarkdown/)
