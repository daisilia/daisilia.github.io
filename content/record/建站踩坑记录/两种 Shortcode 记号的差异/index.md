---
title: "两种 Shortcode 记号的差异"
date: 2023-02-11T17:56:20+08:00
lastmod: 2023-02-19T19:47:48+08:00
comments: true
math: false
---

Hugo 的 Shortcode 可以使用 `{{</* */>}}` 和 `{{%/* */%}}` 两种记号。两者之间存在微妙的差异，有时可能引起问题。

参考：[Hugo Discourse - .Destination from rel or relref does has unexpect prefix](https://discourse.gohugo.io/t/solved-destination-from-rel-or-relref-does-has-unexpect-prefix/42848/2)

<!--more-->

## 两种记号的差别

### 使用 `{{</* */>}}` 记号

在被（Goldmark）渲染之前，Shortcode 会先被 Hugo 用占位符替代。

每个使用 `{{</* */>}}` 记号的 Shortcode 都有不同的占位符（包含序数）。

在页面被 Goldmark 渲染之后，Hugo 会将占位符替换为处理后的对应 Shortcode。

### 使用 `{{%/* */%}}` 记号

Shortcode 的处理和替换在 Goldmark 处理之前，处理之后的文本会被 Goldmark 处理。

## 如何选择用哪种记号

{{< figure src="Hugo Shortcode 处理.svg" title="Hugo Shortcode 处理流程" caption="" attr="" alt="Hugo Shortcode 处理流程" class="" id="fig_hugo-shortcode-处理流程" >}}

如果使用 `{{%/* */%}}` 记号，经 Hugo 处理过的内容会再次被 Goldmark 再处理，这样可以不用在 Hugo 模板文件中使用 `markdownify`，但如果经模板生成的文本比较复杂，交给 Goldmark 处理可能会发生意料之外的问题。当使用**比较简单的 Shortcode** 时，可以考虑使用 `%`。不过要注意的是，经 Hugo 模板生成的内容中，HTML 标签内的内容不会被 Goldmark 渲染。

而如果使用 `{{</* */>}}` 记号，经 Hugo 处理过的内容不经过 Goldmark 的处理就直接插入最终渲染结果中，**推荐使用**。

{{% quote author="" work="" style="" cite="https://discourse.gohugo.io/t/misunderstanding-of-shortcode-syntax-in-0-55/18538/17" %}}
So, beyond the very simple examples, if you want to preserve HTML as … HTML without any encoding/formatting issues, you want to use the `{{</*/* */*/>}}`.
{{% /quote %}}

### 嵌套 Shortcode

对于嵌套的 Shortcode，为保证正确渲染，最外层应使用 `{{%/* */%}}` 记号，而内部（无论是嵌套的第几层）应使用 `{{</* */>}}` 记号。

{{% quote author="" work="" style="" cite="https://gohugo.io/content-management/shortcodes/#shortcodes-with-markdown" %}}
In Hugo 0.55 we changed how the `%` delimiter works. Shortcodes using the `%` as the outer-most delimiter will now be fully rendered when sent to the content renderer. They can be part of the generated table of contents, footnotes, etc.
{{% /quote %}}

