---
title: Ecological Statistics
layout: page
permlink: /ecological-statistics.html
image: /img/RStudio_library.jpg
css: "/css/index.css"
---

<div class="list-filters">
  <a href="https://bookdown.org/ageraci/STAT160Companion/" class="list-filter filter-selected">R companion</a>
  <a href="awesome-rshiny" class="list-filter">AwesomeShiny</a>
<a href="shiny-salesman" class="list-filter">Shiny example</a>
<a href="stats-for-bio" class="list-filter">Text book</a>
</div>

Statistics in ecology can be a tricky endeavour with real data. My PhD research focuses on Bayesian Hierarchical Modelling with Ecological Data. These are the resources I have used and still do at times. To begin to understand and teach Bayesian methods I often refer to older and often more understood statistical methods.

## General ecological statistics

These are the resources I often talk about and personally use regularly. I have only added my brief notes and am no way affiliated or represent any of the resources below. I haven't meet many of these researchers and developers but hopefully one day. Most of the resources are open-source and are forked to my personal [github account](https://github.com/davan690/).

[Colby Ecology Course](https://colbyecology.github.io/): A mathematical ecology course that I have not done but I think it looks pretty kol. Let me know if anyone does it.

[STAT545](http://stat545.com/Classroom/): This is an amazing graduate course from the University of British Columbia. I will often return to this course to check code and explanations I need.

[Cheat-sheets](https://www.rstudio.com/resources/cheatsheets/): These are really important and RStudio do many good ones. There are many other variations out there though.

[The Statistics Network](https://davan690.github.com/usefulr/): My personal list of resources but in particular look at the `usefulr` repository. I am updating this as and when I find new resources. Mostly, this list is to support my own development and to remind myself how to do many of these R and Markdown tricks and tips I find on the web.

## News

On this page I hope to link some of my phd outputs to the current research and development in the greater ecological environment.

Here are some ecologically focused posted:

<div>
  {% for page in site.pages %}
  {% if page.categories contains 'stink' %}
    <div class="item">
      <h3><a href="{{ page.url }}">
        {{ page.title }}
      </a></h3>

      <p>{{page.description}}</p>  
    </div>
  {% endif %}
{% endfor %}
</div>

<div class = "content" align = "center"><a href= "https://www.ssnhub.com/general-statistics/" class="btn btn-primary">General Statistics</a> | <a href= "https://www.ssnhub.com/ecological-statistics/" class="btn btn-primary">Ecological Statistics</a> | <a href= "https://www.ssnhub.com/invasive-species-research/" class="btn btn-primary">Invasive species research</a>
</div>

  <div class="posts-list">
    {% for post in paginator.posts %}
    <article class="post-preview">
      <a href="{{ post.url | prepend: site.baseurl }}">
      <h3 class="post-title">{{ post.title }}</h3>
  
      {% if post.subtitle %}
      <h4 class="post-subtitle">
        {{ post.subtitle }}
      </h4>
      {% endif %}
      </a>
  
      <p class="post-meta">
        Posted on {{ post.date | date: "%B %-d, %Y" }}
      </p>
  
      <div class="post-entry-container">
        {% if post.image %}
        <div class="post-image">
          <a href="{{ post.url | prepend: site.baseurl }}">
            <img src="{{ post.image }}">
          </a>
        </div>
        {% endif %}
        <div class="post-entry">
          {{ post.excerpt | strip_html | xml_escape | truncatewords: site.excerpt_length }}
          {% assign excerpt_word_count = post.excerpt | number_of_words %}
          {% if post.content != post.excerpt or excerpt_word_count > site.excerpt_length %}
            <a href="{{ post.url | prepend: site.baseurl }}" class="post-read-more">[Read&nbsp;More]</a>
          {% endif %}
        </div>
  
  
     </article>
    {% endfor %}
  </div>