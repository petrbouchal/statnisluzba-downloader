
# statnisluzba-downloader

<!-- badges: start -->
<!-- badges: end -->

This is a set of scripts to automatically download open data published from ISoSS, the Czecj Civil Service information system.

It downloads the current list of open positions and organisational structure of all the orgs included in the Czech Civil Service.

I currently run this via chron locally, but it should really run anywhere.

```r
renv::restore()
targets::tar_make()
```

