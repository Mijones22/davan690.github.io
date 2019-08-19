---
title: Bookdown example blogs 2019
layout: post
tags: ["phd", "tools", "reproducibility"]
image: /img/tools.jpg
bigimg: /img/tools.jpg
---

There are so many amazing blogs on the web for doing different variations of RMarkdown but less on bookdown and converting .md to online books/ebooks. Because this is in the same language as  `Rmd` and developers using the `gitflow` I apply to insure my research projects are reproducible. I believe that this is a considerable step in the right direction for science.

{: style="text-align: justify"}

- [The whole bookdown guide for a start](https://rmarkdown.rstudio.com/articles_docx.html/): its good but it just seems that an independent blog or `a stack-overflow` feed is easier to find the answers in. A good start to begin to build RMarkdown documents quickly.

- 

## DOCx fun!

I hate to think currently but there are many options around this using a range of workflows.

## My notes

*From bookdown chapter on components*

Blockquotes are written after `>`, e.g.,

```markdown
> "I thoroughly disapprove of duels. If a man should challenge me,
  I would take him kindly and forgivingly by the hand and lead him
  to a quiet place and kill him."
>
> --- Mark Twain
```

The actual output (we customized the style for blockquotes in this book):

> "I thoroughly disapprove of duels. If a man should challenge me,
  I would take him kindly and forgivingly by the hand and lead him
  to a quiet place and kill him."
>
> --- Mark Twain

Plain code blocks can be written after three or more backticks, and you can also indent the blocks by four spaces, e.g.,

````markdown
```
This text is displayed verbatim / preformatted
```

Or indent by four spaces:

    This text is displayed verbatim / preformatted
````

### Math expressions

Inline LaTeX equations\index{LaTeX math expression} can be written in a pair of dollar signs using the LaTeX syntax, e.g., `$f(k) = {n \choose k} p^{k} (1-p)^{n-k}$` (actual output: $f(k)={n \choose k}p^{k}(1-p)^{n-k}$); math expressions of the display style can be written in a pair of double dollar signs, e.g., `$$f(k) = {n \choose k} p^{k} (1-p)^{n-k}$$`, and the output looks like this:

$$f\left(k\right)=\binom{n}{k}p^k\left(1-p\right)^{n-k}$$

You can also use math environments inside `$ $` or `$$ $$`, e.g.,

```latex
$$\begin{array}{ccc}
x_{11} & x_{12} & x_{13}\\
x_{21} & x_{22} & x_{23}
\end{array}$$
```

$$\begin{array}{ccc}
x_{11} & x_{12} & x_{13}\\
x_{21} & x_{22} & x_{23}
\end{array}$$

```latex
$$X = \begin{bmatrix}1 & x_{1}\\
1 & x_{2}\\
1 & x_{3}
\end{bmatrix}$$
```

$$X = \begin{bmatrix}1 & x_{1}\\
1 & x_{2}\\
1 & x_{3}
\end{bmatrix}$$

```latex
$$\Theta = \begin{pmatrix}\alpha & \beta\\
\gamma & \delta
\end{pmatrix}$$
```

$$\Theta = \begin{pmatrix}\alpha & \beta\\
\gamma & \delta
\end{pmatrix}$$
