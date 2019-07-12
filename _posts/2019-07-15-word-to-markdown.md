---
layout: post
title: "Going against the grain"
subtitle: "Converting a word document to mardown for gitHUB"
use-site-title: true
---

Here are some blogs on where this situation is:

- [A git option](https://github.com/davan690/docx2md)
- [A complex java stript solution](https://www.freecodecamp.org/news/how-to-generate-a-github-markdown-file-from-microsoft-word-using-typescript-a8976ea958c3/)
- A simple solution using [pandoc](https://pandoc.org/) is avaliable [here](https://ronn-bundgaard.dk/blog/convert-docx-to-markdown-with-pandoc/)
- [Stack discussion](https://stackoverflow.com/questions/16383237/how-can-doc-docx-files-be-converted-to-markdown-or-structured-text) that lead me to the `pandoc` solution above.

Pandoc seems like the way to go as RMarkdown uses this too. I guess it is just a matter of time before the next coding superstar writes this convervion script for RStudio users.

### Cheatsheets

{% for post in site.tags["shiny"] %} [{{ post.title }}](https://github.com/davan690/beech-forest-dynamics/blob/master/{{ post.url }}) ({{ post.date | date_to_string }})
{{ post.description }} {% endfor %}