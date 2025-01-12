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

Traditionally the package `sp` has been the standard for storing spatial data in R. This package (along with others such as `raster`) help make R a powerful GIS. However, `sp`'s days may be numbered. I've recently been playing around with the new [R package `sf`](https://github.com/edzer/sfr) which is meant to supersede `sp`. This package provides native support for [Simple Features](https://en.wikipedia.org/wiki/Simple_Features) in R, can perform topological operations by interfacing with [GEOS](https://trac.osgeo.org/geos), and can read and write to a wide variety of spatial file formats courtesy of [GDAL](http://www.gdal.org/).

Thus far I've been really impressed with the functionality provided by `sf`; it appears to do everything `sp`, `rgdal`, and `rgeos` did, but in a more modern and intuitive fashion. However, perhaps my favourite thing about `sf` is that the authors have clearly been informed by the design principles of Hadley Wickham's [Tidyverse](http://tidyverse.org/). In particular, I've noticed the following features:

- Spatial objects are stored as data frames, with the feature geometries stored in list-columns
- All functions begin with `st_` for easy RStudio tab completion, and `snake_case` is used throughout the package
- Functions are pipe-friendly
- `dplyr` and `tidyr` verbs have been defined for the `sf` objects
- `ggplot2` will soon be able to plot `sf` objects directly

These features make `sf` fit into modern data analysis pipelines much better than `sp`. For example, it always frustrated me that I couldn't use `dplyr` verbs like `mutate()` or `select()` with `sp`, and that I always had to convert `sp` objects to data frames before using `ggplot2`. I don't think the existing package vignettes sufficiently highlight the Tidy-ness of `sf`, so I've put together this post to cover some of the features I've discovered in my initial explorations of the package. Much of this material is touched on in the discussion in [this issue](https://github.com/edzer/sfr/issues/42) on the GitHub repository for the package.

## Required packages

Obviously, we'll need to load `sf` and the `tidyverse`. Note that I'm using the most up-to-date versions of all packages and, in some cases (e.g. `ggplot2`), I'm using development versions from GitHub.


```r
library(sf)
library(tidyverse)
library(viridis)
library(rvest)
```

## Simple Features as data frames

[Simple Features](https://en.wikipedia.org/wiki/Simple_Features) is an open source standard for the representation of real-world objects (i.e. features) in the computer. The [first vignette](https://edzer.github.io/sfr/articles/sf1.html) for the `sf` package describes in detail the different types of features that can be represented (e.g. `POINT`, `LINESTRING`, `POLYGON`, etc.) and how to work with them using the functions in `sf`. What I want to focus on here is that `sf` uses the familiar data frame to store features, rather than the more opaque S4 objects used by `sp`. Most of this material is taken almost directly from the [first vignette](https://edzer.github.io/sfr/articles/sf1.html), so if you've worked through that, you can skip ahead to the next section. 

In this package, sets of features are stored as data frames with the additional class `sf`. Each row consists of a feature and each column an attribute. The difference compared to a normal data frame is that there is an additional list-column of class `sfc` storing the feature geometries. Each element of the `sfc` column is a object of class `sfg`, the geometry of a single feature.

Let's start by loading some sample data from the package. This is a shapefile of counties in North Carolina. I'll also convert this to an `sp` object for comparison.


```r
nc <- st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
# limit to first 2 counties
nc <- nc[1:2,]
# convert to SpatialPolygonsDataFrame
nc_sp <- as(nc, "Spatial")
```

The resulting `sf` object is essentially just a `data.frame` with an extra column for the spatial information.


```r
class(nc)
#> [1] "sf"         "data.frame"
glimpse(nc)
#> Observations: 2
#> Variables: 15
#> $ AREA      <dbl> 0.114, 0.061
#> $ PERIMETER <dbl> 1.442, 1.231
#> $ CNTY_     <dbl> 1825, 1827
#> $ CNTY_ID   <dbl> 1825, 1827
#> $ NAME      <fctr> Ashe, Alleghany
#> $ FIPS      <fctr> 37009, 37005
#> $ FIPSNO    <dbl> 37009, 37005
#> $ CRESS_ID  <int> 5, 3
#> $ BIR74     <dbl> 1091, 487
#> $ SID74     <dbl> 1, 0
#> $ NWBIR74   <dbl> 10, 10
#> $ BIR79     <dbl> 1364, 542
#> $ SID79     <dbl> 0, 3
#> $ NWBIR79   <dbl> 19, 12
#> $ geometry  <simple_feature> MULTIPOLYGON (((-81.4727554..., MULTIPOLY...
# convert to tibble for nicer printing
as_tibble(nc)
#> # A tibble: 2 x 15
#>    AREA PERIMETER CNTY_ CNTY_ID      NAME   FIPS FIPSNO CRESS_ID BIR74
#> * <dbl>     <dbl> <dbl>   <dbl>    <fctr> <fctr>  <dbl>    <int> <dbl>
#> 1 0.114     1.442  1825    1825      Ashe  37009  37009        5  1091
#> 2 0.061     1.231  1827    1827 Alleghany  37005  37005        3   487
#> # ... with 6 more variables: SID74 <dbl>, NWBIR74 <dbl>, BIR79 <dbl>,
#> #   SID79 <dbl>, NWBIR79 <dbl>, geometry <simple_feature>
```

The great thing about this is that everyone knows how to work with data frames in R, so these `sf` objects are easy to inspect and play around with. Furthermore, this keeps the geometry and attribute data together in one place, i.e. they're in the same row of the data frame. Contrast this to `sp`, which stores these data in an S4 object of class `SpatialPolygonsDataFrame`:


```r
class(nc_sp)
#> [1] "SpatialPolygonsDataFrame"
#> attr(,"package")
#> [1] "sp"
str(nc_sp)
#> Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots
#>   ..@ data       :'data.frame':	2 obs. of  14 variables:
#>   .. ..$ AREA     : num [1:2] 0.114 0.061
#>   .. ..$ PERIMETER: num [1:2] 1.44 1.23
#>   .. ..$ CNTY_    : num [1:2] 1825 1827
#>   .. ..$ CNTY_ID  : num [1:2] 1825 1827
#>   .. ..$ NAME     : Factor w/ 100 levels "Alamance","Alexander",..: 5 3
#>   .. ..$ FIPS     : Factor w/ 100 levels "37001","37003",..: 5 3
#>   .. ..$ FIPSNO   : num [1:2] 37009 37005
#>   .. ..$ CRESS_ID : int [1:2] 5 3
#>   .. ..$ BIR74    : num [1:2] 1091 487
#>   .. ..$ SID74    : num [1:2] 1 0
#>   .. ..$ NWBIR74  : num [1:2] 10 10
#>   .. ..$ BIR79    : num [1:2] 1364 542
#>   .. ..$ SID79    : num [1:2] 0 3
#>   .. ..$ NWBIR79  : num [1:2] 19 12
#>   ..@ polygons   :List of 2
#>   .. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#>   .. .. .. ..@ Polygons :List of 1
#>   .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#>   .. .. .. .. .. .. ..@ labpt  : num [1:2] -81.5 36.4
#>   .. .. .. .. .. .. ..@ area   : num 0.114
#>   .. .. .. .. .. .. ..@ hole   : logi FALSE
#>   .. .. .. .. .. .. ..@ ringDir: int 1
#>   .. .. .. .. .. .. ..@ coords : num [1:27, 1:2] -81.5 -81.5 -81.6 -81.6 -81.7 ...
#>   .. .. .. ..@ plotOrder: int 1
#>   .. .. .. ..@ labpt    : num [1:2] -81.5 36.4
#>   .. .. .. ..@ ID       : chr "1"
#>   .. .. .. ..@ area     : num 0.114
#>   .. ..$ :Formal class 'Polygons' [package "sp"] with 5 slots
#>   .. .. .. ..@ Polygons :List of 1
#>   .. .. .. .. ..$ :Formal class 'Polygon' [package "sp"] with 5 slots
#>   .. .. .. .. .. .. ..@ labpt  : num [1:2] -81.1 36.5
#>   .. .. .. .. .. .. ..@ area   : num 0.0614
#>   .. .. .. .. .. .. ..@ hole   : logi FALSE
#>   .. .. .. .. .. .. ..@ ringDir: int 1
#>   .. .. .. .. .. .. ..@ coords : num [1:26, 1:2] -81.2 -81.2 -81.3 -81.3 -81.3 ...
#>   .. .. .. ..@ plotOrder: int 1
#>   .. .. .. ..@ labpt    : num [1:2] -81.1 36.5
#>   .. .. .. ..@ ID       : chr "2"
#>   .. .. .. ..@ area     : num 0.0614
#>   ..@ plotOrder  : int [1:2] 1 2
#>   ..@ bbox       : num [1:2, 1:2] -81.7 36.2 -80.9 36.6
#>   .. ..- attr(*, "dimnames")=List of 2
#>   .. .. ..$ : chr [1:2] "x" "y"
#>   .. .. ..$ : chr [1:2] "min" "max"
#>   ..@ proj4string:Formal class 'CRS' [package "sp"] with 1 slot
#>   .. .. ..@ projargs: chr "+proj=longlat +datum=NAD27 +no_defs +ellps=clrk66 +nadgrids=@conus,@alaska,@ntv2_0.gsb,@ntv1_can.dat"
```

Note that the attribute data is stored as a `data.frame` in the `data` slot and the features are stored separately in the `polygons` slot. Delving into this `polygons` object reveals a series of nested lists and S4 objects, which can be confusing to work with directly.

The geometry list-column of an `sf` object is an object of class `sfc` and an additional class corresponding to the geometry type, in this case `sfc_MULTIPOLYGON`. It can be accessed with `st_geometry()`. Additional information about the features, such as the coordinate reference system, is stored as attributes:


```r
(nc_geom <- st_geometry(nc))
#> Geometry set for 2 features 
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -81.74107 ymin: 36.23436 xmax: -80.90344 ymax: 36.58965
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
st_geometry(nc) %>% class()
#> [1] "sfc_MULTIPOLYGON" "sfc"
# attributes
attributes(nc_geom)
#> $class
#> [1] "sfc_MULTIPOLYGON" "sfc"             
#> 
#> $precision
#> [1] 0
#> 
#> $bbox
#>      xmin      ymin      xmax      ymax 
#> -81.74107  36.23436 -80.90344  36.58965 
#> 
#> $crs
#> Coordinate Reference System:
#>   EPSG: 4267 
#>   proj4string: "+proj=longlat +datum=NAD27 +no_defs"
#> 
#> $n_empty
#> [1] 0
```

Finally, individual simple features are `sfg` objects with additional classes corresponding to the specific type of feature. Here classes `XY` and `MULTIPOLYGON` specify that this is a 2-dimensional `MULTIPOLYGON` geometry.


```r
nc_geom[[1]] %>% class
#> [1] "XY"           "MULTIPOLYGON" "sfg"
```

Internally, these `sfg` objects are vectors for points, matrices for `LINESTRING` objects, and lists for anything else. Further details are available in the package vignette.

## Tidyverse support

The main takeaway from the previous section is **`sf` objects are data frames!** Since data frames are at the core of the Tidyverse is seems reasonable that many of the functions from Tidyverse packages should be applicable to the spatial objects from `sf`. Sure enough the creators of `sf` have provided methods for all the standard `dplyr` and `tidyr` verbs that we know and love. Furthermore, the development version of `ggpplot2` supports plotting of `sf` objects.

## `ggplot`

With `sp`, spatial objects had to be converted to data frames (e.g. with `fortify()`) prior to plotting with `ggplot2`, however, since `sf` objects are already data frames they can be plotted with the help of the new `geom_sf()`.


```r
nc <- st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
ggplot(nc) +
  geom_sf(aes(fill = AREA)) +
  scale_fill_viridis("Area") +
  ggtitle("Area of counties in North Carolina") +
  theme_bw()
```

<img src="/figures//tidy-sf_ggplot-1.svg" title="plot of chunk ggplot" alt="plot of chunk ggplot" style="display: block; margin: auto;" />

In addition, the new `coord_sf()` can be used to plot these features in a different projection, for example an Albers equal area projection.


```r
ggplot(nc) +
  geom_sf(aes(fill = AREA)) +
  scale_fill_viridis("Area") +
  coord_sf(crs = st_crs(102003)) +
  ggtitle("Area of counties in North Carolina (Albers)") +
  theme_bw()
```

<img src="/figures//tidy-sf_ggplot-proj-1.svg" title="plot of chunk ggplot-proj" alt="plot of chunk ggplot-proj" style="display: block; margin: auto;" />

## `dplyr`

`dplyr` is the gold standard for data manipulation and offers a variety of benefits compared to base R functions. It is specifically designed for working with `data.frame`-like objects such as those from the `sf` package. The following verbs operate only on the attribute data and leave the geometries untouched:

- `select()` keeps the specified variables, possibly renaming them
- `rename()` renames a variable and leaves all others unchanged
- `filter()` returns the rows that match the given conditions
- `mutate()` adds new variables based on existing variables
- `transmute()` creates new variables and drops existing variables
- `arrange()` sorts by the given variables
- `slice()` selects rows based on row number
- `sample_n()` samples n features randomly

The following example demonstrates the use of these verbs:


```r
nc %>% 
  # calulate area in km^2
  mutate(area_km2 = AREA * 10000) %>% 
  # select desired columns, note geometry column not explicitly selected
  select(name = NAME, area_km2) %>% 
  # filter to counties over 1,000 km^2
  filter(area_km2 > 2000) %>% 
  # arrange in descending order of area
  arrange(desc(area_km2)) %>% 
  # select first three rows
  slice(1:3)
#> Simple feature collection with 3 features and 2 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -79.45597 ymin: 33.94867 xmax: -78.11374 ymax: 35.31512
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
#> # A tibble: 3 x 3
#>       name area_km2          geometry
#>     <fctr>    <dbl>  <simple_feature>
#> 1  Sampson     2410 <MULTIPOLYGON...>
#> 2  Robeson     2400 <MULTIPOLYGON...>
#> 3 Columbus     2400 <MULTIPOLYGON...>
```

Note here that the geometry column is retained unmodified, despite not being explicitly `select()`ed. `transmute()` and `rename()` work similarly:


```r
# transmute drops all variables other than the new one
nc %>% 
  # calulate area in km^2
  transmute(area_km2 = AREA * 10000) %>%
  # rename the geometry column
  rename(geom = geometry) %>% 
  names()
#> [1] "area_km2" "geom"
```

We can take a random sample of features from the set using `sample_n()`:


```r
nc %>% 
  select(AREA) %>% 
  sample_n(4) %>% 
  as_tibble()
#> # A tibble: 4 x 2
#>    AREA          geometry
#> * <dbl>  <simple_feature>
#> 1 0.111 <MULTIPOLYGON...>
#> 2 0.219 <MULTIPOLYGON...>
#> 3 0.203 <MULTIPOLYGON...>
#> 4 0.121 <MULTIPOLYGON...>
```

It is also possible to use functions from `sf` that act on the geometry column within a mutate statement. For example, if there wasn't already an area column, one could be created using `st_area()`:


```r
nc %>% 
  mutate(area_m2 = st_area(geometry)) %>% 
  select(name = NAME, area_m2, area = AREA) %>% 
  head() %>% 
  as_tibble()
#> # A tibble: 6 x 4
#>          name        area_m2  area          geometry
#> *      <fctr>    <S3: units> <dbl>  <simple_feature>
#> 1        Ashe 1137388604 m^2 0.114 <MULTIPOLYGON...>
#> 2   Alleghany  611077263 m^2 0.061 <MULTIPOLYGON...>
#> 3       Surry 1423489919 m^2 0.143 <MULTIPOLYGON...>
#> 4   Currituck  694546292 m^2 0.070 <MULTIPOLYGON...>
#> 5 Northampton 1520740530 m^2 0.153 <MULTIPOLYGON...>
#> 6    Hertford  967727952 m^2 0.097 <MULTIPOLYGON...>
```

### Grouped operations

`dplyr` also allows for group-wise operations on `sf` objects. `group_by()` groups a data frame by variables within the table. Subsequently, `summarise()` is used to perform group-wise summaries of the data. Let's start by adding an arbitrary grouping variable, then calculate areas averaged over this variable.


```r
# add an arbitrary grouping variable
nc_groups <- nc %>% 
  mutate(group = sample(LETTERS[1:3], nrow(.), replace = TRUE))
# average area by group
nc_mean_area <- nc_groups %>% 
  group_by(group) %>% 
  summarise(area_mean = mean(AREA))
# plot
ggplot(nc_mean_area) +
  geom_sf(aes(fill = area_mean)) +
  scale_fill_distiller("Area", palette = "Greens") +
  ggtitle("Mean area by group") +
  theme_bw()
```

<img src="/figures//tidy-sf_summarize-1.svg" title="plot of chunk summarize" alt="plot of chunk summarize" style="display: block; margin: auto;" />

Notice that in addition to the attribute data being aggregated, the geometries have been aggregated as well. All geometries in each group have been combined together and the boundaries between adjacent geometries dissolved. Internally, the function `st_union()` is used to achieve this.

As with normal data frame, grouped filtering and mutating can be performed on `sf` objects. For example, to calculate the proportional allocation of births between counties within each group, use a grouped `mutate()`:


```r
# grouped mutate: proportional area of county within group
nc_groups %>% 
  select(group, AREA) %>% 
  group_by(group) %>% 
  ungroup() %>% 
  mutate(area_prop = sum(AREA)) %>% 
  as_tibble()
#> Simple feature collection with 100 features and 3 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -84.32385 ymin: 33.88199 xmax: -75.45698 ymax: 36.58965
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
#> # A tibble: 100 x 4
#>    group  AREA area_prop          geometry
#>    <chr> <dbl>     <dbl>  <simple_feature>
#>  1     A 0.114    12.626 <MULTIPOLYGON...>
#>  2     C 0.061    12.626 <MULTIPOLYGON...>
#>  3     C 0.143    12.626 <MULTIPOLYGON...>
#>  4     B 0.070    12.626 <MULTIPOLYGON...>
#>  5     B 0.153    12.626 <MULTIPOLYGON...>
#>  6     A 0.097    12.626 <MULTIPOLYGON...>
#>  7     A 0.062    12.626 <MULTIPOLYGON...>
#>  8     A 0.091    12.626 <MULTIPOLYGON...>
#>  9     C 0.118    12.626 <MULTIPOLYGON...>
#> 10     B 0.124    12.626 <MULTIPOLYGON...>
#> # ... with 90 more rows
```

Note that this currently throws an error, but [I've filed an issue](https://github.com/edzer/sfr/issues/42) and the problem has been fixed in the development version of the package.

To only retain countries within groups that have area greater than a given threshold, a grouped `filter()` can be used:


```r
# grouped filter: only keep counties in groups with area greater than 0.13
nc_groups %>% 
  select(group, AREA) %>% 
  group_by(group) %>% 
  filter(mean(AREA) > 0.13) %>% 
  as_tibble()
#> Simple feature collection with 38 features and 2 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -83.25912 ymin: 33.94867 xmax: -75.45698 ymax: 36.55716
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
#> # A tibble: 38 x 3
#> # Groups:   group [1]
#>    group  AREA          geometry
#>    <chr> <dbl>  <simple_feature>
#>  1     B 0.070 <MULTIPOLYGON...>
#>  2     B 0.153 <MULTIPOLYGON...>
#>  3     B 0.124 <MULTIPOLYGON...>
#>  4     B 0.153 <MULTIPOLYGON...>
#>  5     B 0.072 <MULTIPOLYGON...>
#>  6     B 0.081 <MULTIPOLYGON...>
#>  7     B 0.064 <MULTIPOLYGON...>
#>  8     B 0.128 <MULTIPOLYGON...>
#>  9     B 0.170 <MULTIPOLYGON...>
#> 10     B 0.111 <MULTIPOLYGON...>
#> # ... with 28 more rows
```

### Joins

`dplyr` has a series of functions for joining data frames together based on shared columns. These functions have all been implemented in `sf` and are a great way to add additional attribute data from other sources to your spatial data. However, note that it is only possible to join a `sf` object to a plain `data.frame`. In particular, joining two `sf` objects is prohibited.

Let's start by scraping some county-level population data from Wikipedia.


```r
pop <- "https://en.wikipedia.org/wiki/List_of_counties_in_North_Carolina" %>% 
  read_html() %>% 
  html_table(fill = TRUE) %>% 
  `[[`(2) %>% 
  select(County, starts_with("Population")) %>% 
  set_names(c("county", "population")) %>% 
  mutate(county = gsub(" County", "", county),
         population = gsub("(^[0-9]*♠)|,", "", population) %>% parse_integer())
```

Now we'll join this population data to our spatial data and plot it.


```r
nc %>% 
  transmute(county = as.character(NAME)) %>% 
  inner_join(pop, by = "county") %>%
  ggplot() +
    geom_sf(aes(fill = population)) +
    scale_fill_viridis("Population", labels = scales::comma) +
    ggtitle("County-level population in North Carolina") +
    theme_bw()
```

<img src="/figures//tidy-sf_joins-1.svg" title="plot of chunk joins" alt="plot of chunk joins" style="display: block; margin: auto;" />

All the other joining functions (e.g. `left_join()`, `anti_join()`, etc.) work similarly. If the second argument of any of these functions is an `sf` object, and not a normal data frame, an error will be raised. Presumably this is because it's unclear how the two different geometries should be combined, though there does seem to be some [discussion](https://github.com/edzer/sfr/issues/42) about how to implement joins involving two sets of geometries:


```r
inner_join(nc, nc, by = "FIPS")
#> Error in check_join(x, y): y should be a data.frame; for spatial joins, use st_joinFALSE
```

These `dplyr` functions are all for joining based on attribute data. If you're looking to perform a spatial join (e.g. join two `sf` objects based on intersection of geometries) then you should use the function `st_join()`.

## `tidyr` verbs

The `tidyr` verbs `gather()` and `spread()` are used to transform data frames from wide to long format or vice versa, respectively. For example, say you want to store data on GDP for all countries and a set of years. This could be stored in a long format (with columns `country`, `year`, and `gdp`), which would be considered a "tidy" format, or in a wide format (with columns `country`, `gdp2000`, `gdp2001`, ...), which might be better for display purposes. `tidyr` can translate between these formats, and now this can be done with `sf` objects.

Looking at the North Carolina dataset as an example, `BIR74` and `BIR79` are the number of births in the county in 1974 and 1979, respectively. We can easily transpose this with `gather()` into a long format:


```r
nc_gathered <- nc %>% 
  select(county = NAME, BIR74, BIR79, -geometry) %>% 
  slice(1:3) %>% 
  gather(year, births, BIR74, BIR79)
nc_gathered
#> Simple feature collection with 6 features and 3 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -81.74107 ymin: 36.23388 xmax: -80.43531 ymax: 36.58965
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
#> # A tibble: 6 x 4
#>      county  year births          geometry
#>      <fctr> <chr>  <dbl>  <simple_feature>
#> 1      Ashe BIR74   1091 <MULTIPOLYGON...>
#> 2 Alleghany BIR74    487 <MULTIPOLYGON...>
#> 3     Surry BIR74   3188 <MULTIPOLYGON...>
#> 4      Ashe BIR79   1364 <MULTIPOLYGON...>
#> 5 Alleghany BIR79    542 <MULTIPOLYGON...>
#> 6     Surry BIR79   3616 <MULTIPOLYGON...>
```

Notice that the attribute data has been nicely transposed. The result of this is that each feature has two rows and the feature geometries have been duplicated. To me this seems odd to be storing the same geometry in multiple places, so I'm not sure of the use case for `gather()` on `sf` objects.

We can transpose this back to the original wide format with `spread()`:


```r
nc_gathered %>% 
	spread(year, births)
#> Simple feature collection with 3 features and 3 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -81.74107 ymin: 36.23388 xmax: -80.43531 ymax: 36.58965
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
#> # A tibble: 3 x 4
#>      county BIR74 BIR79          geometry
#>      <fctr> <dbl> <dbl>  <simple_feature>
#> 1 Alleghany   487   542 <MULTIPOLYGON...>
#> 2      Ashe  1091  1364 <MULTIPOLYGON...>
#> 3     Surry  3188  3616 <MULTIPOLYGON...>
```

Again, I'm not sure of the use case for this at the moment, but it's nice to have this implemented anyway.


## Simple Features as data frames

[Simple Features](https://en.wikipedia.org/wiki/Simple_Features) is an open source standard for the representation of real-world objects (i.e. features) in the computer. The [first vignette](https://edzer.github.io/sfr/articles/sf1.html) for the `sf` package describes in detail the different types of features that can be represented (e.g. `POINT`, `LINESTRING`, `POLYGON`, etc.) and how to work with them using the functions in `sf`. What I want to focus on here is that `sf` uses the familiar data frame to store features, rather than the more opaque S4 objects used by `sp`. Most of this material is taken almost directly from the [first vignette](https://edzer.github.io/sfr/articles/sf1.html), so if you've worked through that, you can skip ahead to the next section. 

In this package, sets of features are stored as data frames with the additional class `sf`. Each row consists of a feature and each column an attribute. The difference compared to a normal data frame is that there is an additional list-column of class `sfc` storing the feature geometries. Each element of the `sfc` column is a object of class `sfg`, the geometry of a single feature.

Let's start by loading some sample data from the package. This is a shapefile of counties in North Carolina. I'll also convert this to an `sp` object for comparison.

```{r nc}
nc <- st_read(system.file("shape/nc.shp", package="sf"), quiet = TRUE)
# limit to first 2 counties
nc <- nc[1:2,]
# convert to SpatialPolygonsDataFrame
nc_sp <- as(nc, "Spatial")
```

