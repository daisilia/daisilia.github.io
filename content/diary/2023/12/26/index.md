---
title: 2023-12-26 Lintr
date: 2023-12-26T12:37:15+08:00
lastmod: 2023-12-26T12:38:33+08:00
comments: true
math: false
---

https://lintr.r-lib.org/articles/lintr.html#using-arguments-to-lint

比如要配置缩进空格数：


```xxx
linters: linters_with_defaults(
    indentation_linter = indentation_linter(indent = 2L)
  )
```
