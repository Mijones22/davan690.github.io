---
title: "A bookdown note"
output: pdf_document
layout: post
subtitle: "Errors in compiling a bookdown chapter with non-unique chunks"
image: /img/tools.jpg
permlink: /bookdown-error1.html
tags: ["website", "overview", "general", "bookdown", "rmd", "tools"]
bigimg: /img/tools.jpg
use-site-title: true
---

Always make sure that the `r` chunks between each `.rmd` file are unique!

```R
#chapter1
#{r setup-chunk}

#chapter2
#{r setup-chunk}

## ERROR OF PAIN...
```

{: .box-warning}
**Warning**: The error is hard to understand where it might be if you forget as I did! :)

