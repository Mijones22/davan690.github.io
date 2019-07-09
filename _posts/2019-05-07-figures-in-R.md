---
title: "Figures in R"
subtitle: "A run-down on how to get them in and out"
layout: post
tags: ["general", "overview", "website", "rmd", "R", "osf"]
image: /img/tools.jpg
bigimg: /img/tools.jpg
permlink: /figures-in-r-out.html
---

<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/1798851410)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=www.zevross.com) [Tips and tricks for working with images and figures in R Markdown documents | Technical Tidbits From Spatial Analysis & Data Science](http://www.zevross.com/blog/2017/06/19/tips-and-tricks-for-working-with-images-and-figures-in-r-markdown-documents/)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=www.zevross.com) [Tips and tricks for working with images and figures in R Markdown documents | Technical Tidbits From Spatial Analysis & Data Science](http://www.zevross.com/blog/2017/06/19/tips-and-tricks-for-working-with-images-and-figures-in-r-markdown-documents/#use-fig.width-and-fig.height-for-r-generated-figures-only)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=www.zevross.com) [Tips and tricks for working with images and figures in R Markdown documents | Technical Tidbits From Spatial Analysis & Data Science](http://www.zevross.com/blog/2017/06/19/tips-and-tricks-for-working-with-images-and-figures-in-r-markdown-documents/#arguments-out.width-and-out.height-apply-to-both-existing-images-and-r-generated-figures)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=www.zevross.com) [Tips and tricks for working with images and figures in R Markdown documents | Technical Tidbits From Spatial Analysis & Data Science](http://www.zevross.com/blog/2017/06/19/tips-and-tricks-for-working-with-images-and-figures-in-r-markdown-documents/#use-dpi-to-change-the-resolution-of-images-and-figures)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=www.zevross.com) [Tips and tricks for working with images and figures in R Markdown documents | Technical Tidbits From Spatial Analysis & Data Science](http://www.zevross.com/blog/2017/06/19/tips-and-tricks-for-working-with-images-and-figures-in-r-markdown-documents/#the-fig.retina-argument-is-a-resolution-multiplier)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=www.zevross.com) [Tips and tricks for working with images and figures in R Markdown documents | Technical Tidbits From Spatial Analysis & Data Science](http://www.zevross.com/blog/2017/06/19/tips-and-tricks-for-working-with-images-and-figures-in-r-markdown-documents/#bonus-knitr-and-r-markdown-functionality)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=blog.revolutionanalytics.com) [10 tips for making your R graphics look their best (Revolutions)](https://blog.revolutionanalytics.com/2009/01/10-tips-for-making-your-r-graphics-look-their-best.html)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=rmarkdown.rstudio.com) [Cheatsheets](https://rmarkdown.rstudio.com/lesson-15.html)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=www.google.com) [how to turn a bookdown project into a word docx - Google Search](https://www.google.com/search?q=how+to+turn+a+bookdown+project+into+a+word+docx&rlz=1C1GCEV_en&oq=how+to+turn+a+bookdown+project+into+a+word+docx&aqs=chrome..69i57j33.20425j0j4&sourceid=chrome&ie=UTF-8)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=rmarkdown.rstudio.com) [Happy collaboration with Rmd to docx](https://rmarkdown.rstudio.com/articles_docx.html)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/1459801029)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/2192866840)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/1977278322)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/2485850715)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/2095084401)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/1078270459)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/1093117735)</div>
<div style="padding-left: 24px; padding-top: 8px; position: relative; font-size: 13px;">![](https://www.google.com/s2/favicons?domain=app.getpocket.com) [Pocket](https://app.getpocket.com/read/1455427280)</div></div>
Helpful points I just remembered and are probably wrong (but worked once)...

- MUST BE `.png` to render in `RMarkdown`

# figure options

## chunk

`{r figure-one, echo=FALSE, out.width='100%'} #knitr::include_graphics('./Figures/mels-research-devs.jpg')`

## Markdown

`![The full report can be found here](./Figures/mels-research-devs.jpg)`

## Percentage

But this does not work in word documents I dont think

```{r, echo=FALSE,out.width="49%", out.height="20%",fig.cap="caption",fig.show='hold',fig.align='center'}
knitr::include_graphics(c("path/to/img1","path/to/img1"))```

## Tutorials

## My notes
```