---
layout: post
title: ""
subtitle: ""
image: /img/...
permlink: /first-post.html
tags: ["website", "overview", "general"]
bigimg: /img/...
use-site-title: true
---

![](https://media.giphy.com/media/OMeGDxdAsMPzW/giphy.gif)

Orginal resources can be found below:

*   [Home](https://geocompr.github.io/)
*   [Articles](../articles/index.html)
*   [Book](https://github.com/geocompr/geocompkg)


# Spatial data and the tidyverse: pitfalls to avoid

#### Robin Lovelace, Jakub Nowosad, Jannes Muenchow

#### 2019-03-11

<small class="dont-index">Source: [`vignettes/tidyverse-pitfalls.Rmd`](https://github.com/geocompr/geocompkg/blob/master/vignettes/tidyverse-pitfalls.Rmd)</small>

<div class="hidden name">`tidyverse-pitfalls.Rmd`</div>
</div>

<div id="prerequisites" class="section level2">

## [](#prerequisites)Prerequisites

This article is about working with spatial data ‘in the tidyverse’. By this we mean handling spatial datasets using functions (such as `%>%` and `[filter()](https://www.rdocumentation.org/packages/stats/topics/filter)`) and concepts (such as type stability) from R packages that are part of the metapackage **tidyverse**. You should already have an R installation set-up for spatial data analysis [having read Chapter 2](https://geocompr.robinlovelace.net/spatial-class.html) of [the Geocomputation with R book](https://geocompr.github.io/).

If not take a read there now. In any case the **tidyverse** can be installed from CRAN with the following command:

<div class="sourceCode" id="cb1">

    install.packages("tidyverse")

</div>

The **tidyverse** works with spatial data thanks to **sf** which is quite a recent package (first release in 2016). If you have not already got it, get **sf** with:

<div class="sourceCode" id="cb2">

    install.packages("sf")

</div>

The we will also uses a dataset from the **spData** package, which can be installed with:

<div class="sourceCode" id="cb3">

    install.packages("spData")

</div>

</div>

<div id="context" class="section level2">

## [](#context)Context

Software for ‘data science’ is evolving. As we saw in [Chapter 1](https://geocompr.robinlovelace.net/intro.html), R packages **ggplot2** and **dplyr** have become immensely popular. Now they are a part of the **tidyverse**.

These packages use the ‘tidy data’ principles for consistency and speed of processing. According to the `vignette("tidy-data")`, in tidy datasets:

*   Each variable forms a column.
*   Each observation forms a row.
*   Each type of observational unit forms a table

Historically spatial R packages have not been compatible with the **tidyverse**. But this has changed with the release of **sf** and hard work by Edzer Pebesma and Hadley Wickham to make them work together. As described in [Chapter 2](https://geocompr.robinlovelace.net/spatial-class.html), **sf** combines the functionality of three previous packages: **sp**, **rgeos** and **rgdal**. It has many other advantages, including:

*   Consistent function names (`st_*`)
*   More geometry types supported
*   Pulls in functionality from **lwgeom**
*   Compatibility with the **tidyverse**

The final advantage comes with a warning: watch out for pitfalls! That’s topic of this vignette, as illustrated by the following GIF: it’s easy to imagine spatial data analyses but, as Homer Simson discovered with his BBQ project, doing something complicated is easier said than done, especially when combining packages that have only recently started working together:

![](https://media.giphy.com/media/OMeGDxdAsMPzW/giphy.gif)

</div>

<div id="loading-spatial-packages" class="section level2">

## [](#loading-spatial-packages)Loading spatial packages

Now you know the context and have your R setup sorted, it’s time to begin the practical. Execute the following 2 commands to attach spatial data libraries:

<div class="sourceCode" id="cb4">

    library(sf)

</div>

    ## Linking to GEOS 3.7.0, GDAL 2.3.2, PROJ 5.2.0

<div class="sourceCode" id="cb6">

    library(raster)

</div>

    ## Loading required package: sp

Notice the messages: **sf** uses some C libraries behind the scenes. **raster** depends on the older **sp** package which **sf** replaces (confusing I know!).

The next step is to attach the tidyverse, which brings us onto the first pitfall.

</div>

<div id="pitfall-name-clashes" class="section level2">

## [](#pitfall-name-clashes)Pitfall: name clashes

Just loading the tidyverse reveals a pitfall of using spatial data with the tidyverse that affects the **raster** package in particular:

<div class="sourceCode" id="cb8">

    library(tidyverse)

</div>

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
    
    ## ✔ ggplot2 3.1.0       ✔ purrr   0.3.1  
    ## ✔ tibble  2.0.1       ✔ dplyr   0.8.0.1
    ## ✔ tidyr   0.8.3       ✔ stringr 1.4.0  
    ## ✔ readr   1.3.1       ✔ forcats 0.4.0
    
    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ tidyr::extract() masks raster::extract()
    ## ✖ dplyr::filter()  masks stats::filter()
    ## ✖ dplyr::lag()     masks stats::lag()
    ## ✖ dplyr::select()  masks raster::select()

The `first` chunk of output shows that the tidyverse is attaching its packages. ✔ yes we want **ggplot2**, ✔ we want **dplyr** etc. But we also get less positive messages. ✖ Doh! there are many conflicts.

In the context of spatial data this may only be a problem if you use the **raster** package. The final ✖ shows that **dplyr**’s `[select()](https://www.rdocumentation.org/packages/raster/topics/select)` function has boshed (technically speaking, masked) **raster**’s select function. This can cause issues. To avoid this pitfall we suggest using `[dplyr::select()](https://dplyr.tidyverse.org/reference/select.html)` and `[raster::select()](https://www.rdocumentation.org/packages/raster/topics/select)` rather than just `[select()](https://www.rdocumentation.org/packages/raster/topics/select)` when using this conflicted function name if you use **raster** and the **tidyverse**.

</div>

<div id="pitfall-tidyverse-and-sp-dont-play" class="section level2">

## [](#pitfall-tidyverse-and-sp-dont-play)Pitfall: tidyverse and sp don’t play

*   **sp** precedes **sf**  

*   Together with the **rgdal** and **rgeos** package, it creates a powerful tool to works with spatial data
*   Many spatial R packages still depend on the **sp** package, therefore it is important to know how to convert **sp** to and from **sf** objects

<div class="sourceCode" id="cb12">

    library(spData)
    world_sp = as(world, "Spatial")
    world_sf = st_as_sf(world_sp)

</div>

*   The structures in the **sp** packages are more complicated - `[str(world_sf)](https://www.rdocumentation.org/packages/utils/topics/str)` vs `[str(world_sp)](https://www.rdocumentation.org/packages/utils/topics/str)`
*   **sp** doesn’t play well with the **tidyverse**:

<div class="sourceCode" id="cb13">

    world_sp %>% 
      filter(name_long == "England")

</div>

`Error in UseMethod("filter_") : no applicable method for 'filter_' applied to an object of class "c('SpatialPolygonsDataFrame', 'SpatialPolygons', 'Spatial')"`

</div>

<div id="pitfall-multipolygon-objects" class="section level2">

## [](#pitfall-multipolygon-objects)Pitfall: multipolygon objects

This pitfall is not specific to the tidyverse but is worth being aware of. Let’s create a buffer around London of 500 km:

<div class="sourceCode" id="cb14">

    lnd_buff = lnd[1, ] %>% 
      st_transform(crs = 27700) %>%  # uk CRS
      st_buffer(500000) %>%
      st_transform(crs = 4326)
    near_lnd = world[lnd_buff, ]

</div>

    ## although coordinates are longitude/latitude, st_intersects assumes that they are planar

<div class="sourceCode" id="cb16">

    plot(near_lnd$geom)

</div>

![](tidyverse-pitfalls_files/figure-html/unnamed-chunk-8-1.png)

What is going with the country miles away?

The issue is that some objects have multiple geometries:

<div class="sourceCode" id="cb17">

    st_geometry_type(near_lnd)

</div>

    ## [1] MULTIPOLYGON MULTIPOLYGON MULTIPOLYGON MULTIPOLYGON MULTIPOLYGON
    ## [6] MULTIPOLYGON MULTIPOLYGON
    ## 18 Levels: GEOMETRY POINT LINESTRING POLYGON ... TRIANGLE

Which have more than 1?

<div class="sourceCode" id="cb19">

    data.frame(near_lnd$name_long,
               sapply(near_lnd$geom, length))

</div>

    ##   near_lnd.name_long sapply.near_lnd.geom..length.
    ## 1             France                             3
    ## 2            Germany                             1
    ## 3         Luxembourg                             1
    ## 4            Belgium                             1
    ## 5        Netherlands                             1
    ## 6            Ireland                             1
    ## 7     United Kingdom                             2

We can resolve this issue by casting them:

<div class="sourceCode" id="cb21">

    world_poly = world %>% 
      st_cast(to = "POLYGON")
    near_lnd_new = world_poly[lnd_buff, ]
    plot(st_geometry(near_lnd_new))

</div>

![](tidyverse-pitfalls_files/figure-html/unnamed-chunk-11-1.png)

</div>

<div id="pitfall-spatial-subsetting" class="section level2">

## [](#pitfall-spatial-subsetting)Pitfall: spatial subsetting

The previous code chunk shows how spatial subsetting works in base R, with `near_lnd = world_poly[lnd_buff, ]`.

You can also do tidy spatial subsetting:

<div class="sourceCode" id="cb22">

    near_lnd_tidy = world %>% 
      filter(st_intersects(., lnd_buff, sparse = FALSE))

</div>

But there are pitfalls:

*   It’s verbose (you need `sparse = FALSE` in the spatial predicate function)
*   See the next pitfall: it boshes the row names!

</div>

<div id="pitfall-row-names" class="section level2">

## [](#pitfall-row-names)Pitfall: row names

<div class="sourceCode" id="cb23">

    row.names(near_lnd_tidy)

</div>

    ## [1] "1" "2" "3" "4" "5" "6" "7"

<div class="sourceCode" id="cb25">

    row.names(near_lnd)

</div>

    ## [1] "44"  "122" "129" "130" "131" "134" "144"

*   Consequences for joining - rownames can be useful!

Also affects non-spatial data - [tidyverse/dplyr#366](https://github.com/tidyverse/dplyr/issues/366)

</div>

<div id="pitfall-attribute-alteration" class="section level2">

## [](#pitfall-attribute-alteration)Pitfall: attribute alteration

<div class="sourceCode" id="cb27">

    world %>% 
      filter(name_long == "United Kingdom")

</div>

    ## Simple feature collection with 1 feature and 10 fields
    ## geometry type:  MULTIPOLYGON
    ## dimension:      XY
    ## bbox:           xmin: -7.572168 ymin: 49.96 xmax: 1.681531 ymax: 58.635
    ## epsg (SRID):    4326
    ## proj4string:    +proj=longlat +datum=WGS84 +no_defs
    ##   iso_a2      name_long continent region_un       subregion    type
    ## 1     GB United Kingdom    Europe    Europe Northern Europe Country
    ##   area_km2      pop  lifeExp gdpPercap                           geom
    ## 1 249986.4 64613160 81.30488  38251.79 MULTIPOLYGON (((-6.197885 5...

Base R equivalent:

<div class="sourceCode" id="cb29">

    world[world$name_long == "United Kingdom", ]

</div>

Question:

<div class="sourceCode" id="cb30">

    identical(
      world %>% filter(name_long == "United Kingdom"),
      world[world$name_long == "United Kingdom", ]
    ) # ?

</div>

    ## [1] FALSE

Row names usually don’t matter but they can bite.

<div class="sourceCode" id="cb32">

    u1 = world %>% filter(name_long == "United Kingdom")
    u2 = world[world$name_long == "United Kingdom", ]
    row.names(u2) = 1
    identical(u1, u2)

</div>

    ## [1] FALSE

*   Advanced challenge: how to make u1 and u2 identical?

</div>

<div id="pitfall-binding-rows" class="section level2">

## [](#pitfall-binding-rows)Pitfall: binding rows

<div class="sourceCode" id="cb34">

    rbind(near_lnd, near_lnd) # works
    bind_rows(near_lnd, near_lnd)

</div>

    Error in .subset2(x, i, exact = exact) : 
      attempt to select less than one element in get1index

But this does:

<div class="sourceCode" id="cb36">

    near_lnd_data = st_set_geometry(near_lnd, NULL)
    d = bind_rows(near_lnd_data, near_lnd_data)
    d_sf = st_sf(d, geometry = c(near_lnd$geom, near_lnd$geom))
    plot(d_sf)

</div>

![](tidyverse-pitfalls_files/figure-html/unnamed-chunk-20-1.png)

</div>

<div id="raster-data-in-the-tidyverse" class="section level2">

## [](#raster-data-in-the-tidyverse)Raster data in the tidyverse

Raster data is not yet closely connected to the **tidyverse**, however:

*   Some functions from the **raster** package work well in `pipes`
*   You can convert vector data to the `Spatial*` form using `[as(my_vector, "Spatial")](https://www.rdocumentation.org/packages/sf/topics/coerce-methods)`before working on raster-vector interactions
*   There are some initial efforts to bring raster data closer to the **tidyverse**, such as [tabularaster](https://github.com/hypertidy/tabularaster), [sfraster](https://github.com/mdsumner/sfraster), or [fasterize](https://github.com/ecohealthalliance/fasterize), and [stars](https://github.com/r-spatial/stars) - package focused on multidimensional, large datasets

</div>

</div>

<div class="col-md-3 hidden-xs hidden-sm" id="sidebar">

<div id="tocnav">

## [](#tocnav)Contents

*   [Prerequisites](#prerequisites)
*   [Context](#context)
*   [Loading spatial packages](#loading-spatial-packages)
*   [Pitfall: name clashes](#pitfall-name-clashes)
*   [Pitfall: tidyverse and sp don’t play](#pitfall-tidyverse-and-sp-dont-play)
*   [Pitfall: multipolygon objects](#pitfall-multipolygon-objects)
*   [Pitfall: spatial subsetting](#pitfall-spatial-subsetting)
*   [Pitfall: row names](#pitfall-row-names)
*   [Pitfall: attribute alteration](#pitfall-attribute-alteration)
*   [Pitfall: binding rows](#pitfall-binding-rows)
*   [Raster data in the tidyverse](#raster-data-in-the-tidyverse)

</div>

</div>

</div>

<footer>

<div class="copyright">

Developed by Robin Lovelace, Jakub Nowosad, Jannes Muenchow.

</div>

<div class="pkgdown">

Site built with [pkgdown](https://pkgdown.r-lib.org/) 1.3.0.

</div>

</footer>

</div>