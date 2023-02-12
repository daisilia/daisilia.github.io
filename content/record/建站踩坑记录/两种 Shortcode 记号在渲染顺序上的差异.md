---
title: "两种 Shortcode 记号在渲染顺序上的差异"
date: 2023-02-11T17:56:20+08:00
lastmod: 2023-02-12T19:42:20+08:00
comments: true
math: false
---

Hugo 的 Shortcode 可以使用 `{{</* */>}}` 和 `{{%/* */%}}` 两种记号。两者之间存在微妙的差异，有时可能引起问题。

参考：[Hugo Discourse - .Destination from rel or relref does has unexpect prefix](https://discourse.gohugo.io/t/solved-destination-from-rel-or-relref-does-has-unexpect-prefix/42848/2)

<!--more-->

## 两种记号的差别

[使用 Kroki 绘图]({{< relref "使用 Kroki 绘图#TEST1" >}})

### 使用 `{{</* */>}}` 记号

在被（Goldmark）渲染之前，Shortcode 会先被 Hugo 用占位符替代，占位符的样子大概像这样：

    HAHAHUGOSHORTCODE-s0-HBHB

每个使用 `{{</* */>}}` 记号的 Shortcode 都有不同的占位符（包含序数）。

在页面被 Goldmark 渲染之后，Hugo 会将占位符替换为处理后的对应 Shortcode。

### 使用 `{{%/* */%}}` 记号

Shortcode 会直接被 Goldmark 渲染，Hugo 处理 Shortcode 时会得到已经渲染过的内容。

## 嵌套 Shortcode

对于嵌套的 Shortcode，为保证正确渲染，最外层应使用 `{{%/* */%}}` 记号，而内部（无论是嵌套的第几层）应使用 `{{</* */>}}` 记号。
