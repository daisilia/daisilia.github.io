#! /usr/bin/env Rscript

local({
    # fall back on '/' if baseurl is not specified
    baseurl <- blogdown:::get_config2("root", "/")
    knitr::opts_knit$set(
        base.url = baseurl, base.dir = normalizePath("source")
    )

    # input/output filenames are passed as two additional arguments to Rscript
    a <- commandArgs(TRUE)
    d <- gsub("^source/_?|[.][a-zA-Z]+$", "", a[1])
    knitr::opts_chunk$set(
        fig.path   = sprintf("_%s/", d),
        cache.path = sprintf("cache/%s/", d),
        comment    = "#>",
        results    = "hold",
        tiry       = TRUE,
        fig.width  = 10,
        fig.height = 6,
        fig.show   = "hold",
        dpi        = 120,
        message    = FALSE,
        warning    = FALSE,
        error      = TRUE
    )
    options(digits = 4)
    knitr::opts_knit$set(width = 70)
    knitr::knit(a[1], a[2],
        quiet = TRUE, encoding = "UTF-8", envir = .GlobalEnv
    )

    # post processing
    text <- readLines(a[2], encoding = "UTF-8")
    text <- gsub("!\\[(.*?)\\]\\(.*?([^/]*?\\.png)\\)",
        "{% asset_img \"\\2\" \"\\1'\\1'\" %}",
        text,
        perl = TRUE
    )
    writeLines(text, con = a[2], sep = "\n", useBytes = F)
})
