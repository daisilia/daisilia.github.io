---
title: "在代码块中显示 Shortcode 原文"
date: 2023-02-08T23:37:30+08:00
lastmod: 2023-02-08T23:48:08+08:00
comments: true
math: false
---

如果不使用特殊方法，代码块中的 Shortcode 也会被 Hugo 渲染成 HTML。

参考：[How is the Hugo Doc site showing shortcodes in code blocks?](https://discourse.gohugo.io/t/how-is-the-hugo-doc-site-showing-shortcodes-in-code-blocks/9074/16)

<!--more-->

使用 `/*` 和 `*/`，即可实现：

{{< figure src="raw.png" >}}

↓↓↓

```xxx
{{</* kroki type="actdiag" >}}
{
  write -> convert -> image

  lane user {
    label = "User"
    write [label = "Writing reST"];
    image [label = "Get diagram IMAGE"];
  }
  lane actdiag {
    convert [label = "Convert reST to Image"];
  }
}
{{< /kroki */>}}
```


