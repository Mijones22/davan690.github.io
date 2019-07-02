# test yamls.....
bookdown::tufte_html_book: 
  toc: yes 
  css: toc.css

bookdown::pdf_book: 
  base_format: rticles::jss_article

bookdown::epub_book: 
  stylesheet: style.css

bookdown::word_document2:
  reference_docx: template2.doc

##adds a reutn to website buttion
bookdown::gitbook:
  css: style.css
config:
  toc:
  before: |
  <li><a href="./">A Minimal Book Example</a></li>
  after: |
  <li><a href="https://github.com/rstudio/bookdown" target="blank">Published with bookdown</a></li>
  edit: https://github.com/rstudio/bookdown-demo/edit/master/%s
download: ["pdf", "epub"]

title: "Beech forest dynamics"
subtitle: "A simulation"
author: "Anthony Davidson"
date: '2019-05-16'
output: word_document:reference_docx:template.docx
bibliography: Beech-forests.bib

title: "Beech forest dynamics"
subtitle: "A simulation"
author: "Anthony Davidson"
date: '2019-05-16'
output:
  word_document:
  reference_docx:
  template.docx
bibliography: Beech-forests.bib

title: "Beech forest dynamics"
subtitle: "A simulation"
author: "Anthony Davidson"
date: '2019-05-16'
output: word_document:
  reference_docx:template.docx
