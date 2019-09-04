---
title: "faceting, coordinate_flip() and theme()"
author: "Rashedul"
date: "7/2/2019"
output: 
  html_document: 
    keep_md: yes
---



## load libraries


```r
#install.packages("gapminder")
#install.packages("tidyverse")
library(tidyverse)
```

```
## ── Attaching packages ──────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.2.1     ✔ purrr   0.3.2
## ✔ tibble  2.1.3     ✔ dplyr   0.8.3
## ✔ tidyr   0.8.3     ✔ stringr 1.4.0
## ✔ readr   1.3.1     ✔ forcats 0.4.0
```

```
## ── Conflicts ─────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```

```r
library(gapminder)
```

## check data


```r
head(gapminder)
```

```
## # A tibble: 6 x 6
##   country     continent  year lifeExp      pop gdpPercap
##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
## 1 Afghanistan Asia       1952    28.8  8425333      779.
## 2 Afghanistan Asia       1957    30.3  9240934      821.
## 3 Afghanistan Asia       1962    32.0 10267083      853.
## 4 Afghanistan Asia       1967    34.0 11537966      836.
## 5 Afghanistan Asia       1972    36.1 13079460      740.
## 6 Afghanistan Asia       1977    38.4 14880372      786.
```

## make scatter plot 


```r
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point()
```

![](example_ggplot_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

## log transformation of values


```r
#
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point() +
  scale_x_log10()
```

![](example_ggplot_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```r
# try another way
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point()
```

![](example_ggplot_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

# change color


```r
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point(aes(color=continent))
```

![](example_ggplot_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

```r
#change sige of points
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point(aes(color=continent), size = 3)
```

![](example_ggplot_files/figure-html/unnamed-chunk-5-2.png)<!-- -->

# change some other parameters


```r
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point(pch=17, size=2, alpha= .8, aes(color=continent)) 
```

![](example_ggplot_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

```r
# what about this
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point(pch=17, size=2, alpha= .8, color= "red")
```

![](example_ggplot_files/figure-html/unnamed-chunk-6-2.png)<!-- -->

## use smoothing function


```r
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point() +
  geom_smooth()
```

```
## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
```

![](example_ggplot_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

```r
# specify the method for smoothing
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point() +
  geom_smooth(lwd=2, se=FALSE, method="lm", col="blue")
```

![](example_ggplot_files/figure-html/unnamed-chunk-7-2.png)<!-- -->

```r
# smooth by continent
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point() +
  geom_smooth(aes(color = continent))
```

```
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![](example_ggplot_files/figure-html/unnamed-chunk-7-3.png)<!-- -->

```r
# smooth by continent
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point(aes(color = continent)) +
  geom_smooth(aes(color = continent))
```

```
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

![](example_ggplot_files/figure-html/unnamed-chunk-7-4.png)<!-- -->

## example on faceting


```r
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point() +
  facet_wrap(~continent)
```

![](example_ggplot_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

```r
# change faceting  by column
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point() +
  facet_wrap(~continent, ncol=1)
```

![](example_ggplot_files/figure-html/unnamed-chunk-8-2.png)<!-- -->

```r
# change faceting by row
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point() +
  facet_wrap(~continent, nrow =1)
```

![](example_ggplot_files/figure-html/unnamed-chunk-8-3.png)<!-- -->


## voilin, boxplot and jitter


```r
#boxplot
ggplot(gapminder, aes(continent, lifeExp)) +
  geom_jitter() +
  geom_boxplot()
```

![](example_ggplot_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

```r
#color
ggplot(gapminder, aes(continent, lifeExp), fill = continent) +
  geom_jitter(alpha=1/2) +
  geom_boxplot()
```

![](example_ggplot_files/figure-html/unnamed-chunk-9-2.png)<!-- -->

```r
#violin
ggplot(gapminder, aes(continent, lifeExp)) +
  geom_jitter() +
  geom_violin()
```

![](example_ggplot_files/figure-html/unnamed-chunk-9-3.png)<!-- -->

```r
#color
ggplot(gapminder, aes(continent, lifeExp), fill = continent) +
  geom_jitter(alpha=1/2) +
  geom_violin()
```

![](example_ggplot_files/figure-html/unnamed-chunk-9-4.png)<!-- -->

## histograms


```r
ggplot(gapminder, aes(lifeExp)) +
  geom_histogram()
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](example_ggplot_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

```r
# change binsize
ggplot(gapminder, aes(lifeExp)) +
  geom_histogram(bins=50)
```

![](example_ggplot_files/figure-html/unnamed-chunk-10-2.png)<!-- -->

```r
#
ggplot(gapminder, aes(lifeExp)) +
  geom_histogram(bins=100)
```

![](example_ggplot_files/figure-html/unnamed-chunk-10-3.png)<!-- -->

```r
#
ggplot(gapminder, aes(lifeExp)) +
  geom_histogram(bins=500) 
```

![](example_ggplot_files/figure-html/unnamed-chunk-10-4.png)<!-- -->

```r
# color by continent
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(aes(color=continent))
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

![](example_ggplot_files/figure-html/unnamed-chunk-10-5.png)<!-- -->

## density plot


```r
ggplot(gapminder, aes(lifeExp)) + 
  geom_density()
```

![](example_ggplot_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

```r
# color
ggplot(gapminder, aes(lifeExp)) + 
  geom_density(aes(fill= "red"))
```

![](example_ggplot_files/figure-html/unnamed-chunk-11-2.png)<!-- -->

```r
# change alpha
ggplot(gapminder, aes(lifeExp)) + 
  geom_density(aes(fill= "red"), alpha=1/4)
```

![](example_ggplot_files/figure-html/unnamed-chunk-11-3.png)<!-- -->

```r
#
ggplot(gapminder, aes(lifeExp)) + 
  geom_density(aes(fill=continent), alpha=1/4)
```

![](example_ggplot_files/figure-html/unnamed-chunk-11-4.png)<!-- -->





