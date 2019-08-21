---
title: "Rake Software"
subtitle: "What is it all about?"
layout: post
image: /img/tools.jpg
bigimg: /img/tools.jpg
tags: ["website", "overview", "general"]
use-site-title: true
permalink: rake-ruby.html
---

[Rake](https://en.wikipedia.org/wiki/Rake_(software)) is a software task management and build automation tool. It allows the user to specify tasks and describe dependencies as well as to group tasks in a namespace.

### Repository

<github.com/ruby/rake>

Written in the Ruby Operating system. Using the cross-platform type software development tools. Licesnced under [MIT](LicenseWebsiteruby.github.io/rake/).

It is similar to `SCons` and `Make`, but it has a number of differences. The tool is written in the `Ruby` programming language and the `Rakefiles` (equivalent of `Makefiles` in `Make`) use `Ruby` syntax. It was created by Jim Weirich.

Rake uses Ruby's anonymous function blocks to define various tasks, allowing the use of Ruby syntax. It has a library of common tasks: for example, functions to do common file-manipulation tasks and a library to remove compiled files (the "clean" task). Like Make, Rake can also synthesize tasks based on patterns: for example, automatically building a file compilation task based on filename patterns. Rake is now part of the standard library from Ruby version 1.9 onward.

## Resources

- [rack documents](https://ruby-doc.org/https://ruby-doc.org//core-1.9.3/doc/rake/rakefile_rdoc.html): here is the official documentation

- [rack explaination from wiki](https://en.wikipedia.org/wiki/Rake_(software)): sadly this is as far as my knowledge goes...trust me as much on `ruby`!

## My notes

I have looked into this because it is used to build and publish GitHub pages using Jekyll.

With the explosion of static site generators there are many options for building and publishing HTML static sites. I have stuck with Jekyll because it is written by the same person who wrote and developed GitHub and GitHub pages so it is likely to continue to be supported as long as GitHub is around and with the acossition of GitHub by Microsoft in 2015 I am confident it has funding.