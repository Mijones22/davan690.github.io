```
layout: post
title: "Using csl styles in rmd files"
subtitle: "From what is needed for WR journal"
image: /img/tools.jpg
permlink: /csl-template-doc.html
tags: ["website", "overview", "general"]
bigimg: /img/tools.jpg
use-site-title: true
```

YAY!! for `csl` and [stack overflow]().

"I had the same problem. The following procedure worked for me:"

Here are my simple and novice steps.

1. Create new project with RStudio and choose "Book Project using bookdown" as option.
<br>
2. Download some .csl file from [here](https://www.zotero.org/styles) and copy to root of the project/publication. 

In this case it is: `chicago-author-date-de.csl` and I got it from this [link]().
    
3. Set in `_output.yml`

```
citation_package: none
```

4. Add in all formats (gitbook, pdf_book, epub_book) in _output.yml the line pandoc_args: [ "--csl", "chicago-author-date-de.csl" ]

5. Delete or comment out in index.Rmd the line biblio-style: apalike
Replace the content of 06-references.Rmd with # References {-}
Here is my `_output.yml` file:

```
bookdown::gitbook:
  css: style.css
  pandoc_args: [ "--csl", "chicago-author-date-de.csl" ]
  config:
    toc:
      before: |
        <li><a href="./">A Minimal Book Example</a></li>
      after: |
        <li><a href="https://github.com/rstudio/bookdown" target="blank">Published with bookdown</a></li>
    download: ["pdf", "epub"]
bookdown::pdf_book:
  includes:
    in_header: preamble.tex
  latex_engine: xelatex
  citation_package: none
  pandoc_args: [ "--csl", "chicago-author-date-de.csl" ]
  keep_tex: yes
bookdown::epub_book:
  pandoc_args: [ "--csl", "chicago-author-date-de.csl" ]
```

## Resources

Download the csl style here:

*etc* *etc*

## My notes