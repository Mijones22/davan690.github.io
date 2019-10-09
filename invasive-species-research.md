---
title: Invasive Species Modelling
layout: page
permlink: /invasive-species-modelling.html
meta-title: "New Zealands moonshot"
meta-description: "The New Zealand government set a Apollo shot to make NZ free of mammalian predators by 2050."
bigimg:
  - "/img/big-imgs/background-image.jpg" : "Auckland Islands, NZ (2011)"
---

There was lots of press focus at the time (e.g. How [NZ might make PFNZ happen](https://news.nationalgeographic.com/2016/07/new-zealand-invasives-islands-rats-kiwis-conservation/);[Enviroment guide](http://www.environmentguide.org.nz/issues/biodiversity/key-threats/invasive-species/); [NZ geographic PFNZ plan](https://www.wired.com/2016/07/new-zealand-plans-kill-non-human-invasive-mammals/)) and academic interest too (extended info coming but most of the journal articles reference Russell et. al 2015 paper [here](https://academic.oup.com/bioscience/article/65/5/520/323246))

![](/img/national-leaders-announce-pfnz2050.png)

[Media release in 2016 announcing New Zealands Predator Free 2050 “apollo” shot](https://www.stuff.co.nz/environment/82454116/government-sets-target-to-make-new-zealand-predatorfree-by-2050).

Although I am unsure if this is even a good idea but I do know from parts of my PhD research that it will be essential that both previous research, knowledge and data are made in a reproducibly accessible manner for a national scale predator control program. 

This is fundamentally due to the fact that the removal of predators at the national scale will involve removing meta-populations (groups of interacting individuals) across an unknown scale/magnitude of interacting environmental variables from areas with remote human access and heavily impacted ecosystems. These differences are know to have measurable differences in responses to different predator management tools and techniques.

With the continued development of my PhD work I hope to be able to connect community groups with the statistical models needed to gain the timely ecological knowledge needed to response to pest control at a national scale. I believe that this will be vital for a on-going national monitoring needed for a PFNZ by 2050.

This will involve building a national statistical framework for data entry through to publication. This pipeline will allow the general public as there are many volunteer community groups that may not have access or the time to collate and communicate the current understanding of mammalian predators in NZ.

## News

Here are some posts associated with invasive species modelling and PFNZ 2050.

<div class="post">
    <ul>
      {% for post in site.tags["invasive"] %}
          <article class="post-preview">
            <a href="{{ post.url | prepend: site.baseurl }}"></a>
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
                {% endif %}
              </div>
            </div>
      {% endfor %}
   </ul>
</div>

## Resources

- [Predator-free NZ](https://predatorfreenz.org/): The offical start-up organisation for predator-free NZ.

- [DOC](https://www.bnz.co.nz/assets/business-banking/cards-payments/pdfs/doc-casestudy-flexipurchase.pdf): New Zealands Department of Conservation website

- [Worst Invasive Species](https://www.worldatlas.com/articles/the-worst-invasive-mammal-species.html): From the world atlas

- [Wiki NZ invasive species](https://en.wikipedia.org/wiki/Invasive_species_in_New_Zealand#Mammals): This needs updating as it is missing a few species such as weasels?

<div class="post"><ul>
{% for post in site.tags["beech"] %}
  <a href="{{ post.url }}">{{ post.title }}</a> ({{ post.date | date_to_string }})<br>
    {{ post.description }}
{% endfor %}
</ul></div>

## My notes

Please excuse any '404' errors as I am learning and working as I go. Using version control and git means that I am able to use other coders templates and test things out before committing.