---
layout: post
title: "KMZ files are just..."
subtitle: "...zipped KML files"
image: /img/tools.jpg
permlink: /first-post.html
tags: ["website", "overview", "general"]
bigimg: /img/filing.jpg
use-site-title: true
---

A KMZ file is just a zipped KML file, possibly with associated embedded images, icons, etc. So any program that supports KMZ files internally unzips them to access their KML files. That may be a reason why many open source programs do not bother supporting KMZ once KML support is implemented: you just need to use an additional unzipping library of your choice, to convert the KMZ to KML. The linked posts give some JavaScript-based solutions for unzipping.


## My notes

Found in [stack comments here](https://stackoverflow.com/questions/35867793/using-kmz-file-in-leaflet-map)