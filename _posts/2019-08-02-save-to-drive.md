---
layout: post
title: "Saving files to another drive in R"
subtitle: "A simple bit of code"
image: /img/tools.jpg
permlink: /saving-files-in-r.html
tags: ["website", "overview", "general", "r", "tools", "code"]
bigimg: /img/tools.jpg
use-site-title: true
---

Just a nice simple it of code to save files to another directory in R.

```
# Copy individual files to Google Drive

kml_files <- list.files("Data/GPS/KMLs", full.names=TRUE)

output_dir <- file.path("ur file location for g-drive","current folder")
  
file.copy(kml_files, output_dir)
```

