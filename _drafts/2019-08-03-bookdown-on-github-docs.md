---
layout: post
title: "Bookdown hosting"
subtitle: "Using GIThub"
image: /img/...
permlink: /first-post.html
tags: ["website", "overview", "general"]
bigimg: /img/...
use-site-title: true
---

You can host your book on GitHub for free via GitHub Pages ([https://pages.github.com](https://pages.github.com/)). GitHub supports Jekyll ([http://jekyllrb.com](http://jekyllrb.com/)), a static website builder, to build a website from Markdown files. That may be the more common use case of GitHub Pages, but GitHub also supports arbitrary static HTML files, so you can just host the HTML output files of your book on GitHub. The key is to create a hidden file `.nojekyll` that tells GitHub that your website is not to be built via Jekyll, since the **bookdown** HTML output is already a standalone website.

```
# assume you have initialized the git repository,
# and are under the directory of the book repository now

# create a hidden file .nojekyll
touch .nojekyll

# add to git here because will not show up in RStudio
git add .nojekyll
```

If you are on Windows, you may not have the `touch` command, and you can create the file in R using `file.create('.nojekyll')`.

One approach is to publish your book as a GitHub Pages site from a `/docs` folder on your `master`branch as described in [GitHub Help.](http://bit.ly/2cvloKV) First, set the output directory of your book to be `/docs` by 

adding the line `output_dir: "docs"` 

to the configuration file `_bookdown.yml`. 

Then, after pushing your changes to GitHub, 

go to your repository’s settings and 

under “GitHub Pages” 

change the “Source” 

to be “master branch /docs folder”. 

In this case, the `.nojekyll` file has to be in the `/docs` folder.