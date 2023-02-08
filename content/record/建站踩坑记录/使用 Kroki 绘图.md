---
title: "使用 Kroki 绘图"
date: 2023-02-08T19:51:46+08:00
lastmod: 2023-02-09T00:58:14+08:00
comments: true
math: false
---

在提交 [063c974](https://github.com/alohaia/hugo-theme-daisilia/commit/063c974720900f1033b222469a4c757d7889ca62) 中，添加了利用 Kroki 绘图的功能。

方法参考自 [Hugo discourse - Is there some pre-packaged way to use Kroki from markdown?](https://discourse.gohugo.io/t/is-there-some-pre-packaged-way-to-use-kroki-from-markdown/36924/3)。

在线编辑器：[Niolesk: Edit **diagrams** from **textual** descriptions! A kroki interface.](https://niolesk.top/)。

<!--more-->

## 代码块和 Shortcode

提交 [063c974](https://github.com/alohaia/hugo-theme-daisilia/commit/063c974720900f1033b222469a4c757d7889ca62) 中的关键文件有两个——`layouts/_default/_markup/render-codeblock-kroki.html` 和 `layouts/shortcodes/kroki.html`，前者将 `kroki` 代码块替换为 SVG 图像，后者则使用 Hugo 的 shortcode 功能。

````
```kroki {type=actdiag}
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
```
````

↓↓↓

```kroki {type=actdiag}
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
```

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

↓↓↓

{{< kroki type="actdiag" >}}
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
{{< /kroki >}}

## 可用选项

### 代码块

传递给代码块的属性（Attributions）会全部原封不动地加在 `figure` 标签上，除了以下几个需要注意：

- `type` 会被忽略
- `width` 会被放进 `style` 属性中
- `class` 的开头会加上 `diagram-kroki diagram-kroki-{type}`，`{type}` 即 `type` 属性
- `alt` 和 `img-width`：
    - `alt` 会加在 `img` 标签上
    - `img-width` 会作为 `width` 属性加在 `img` 标签上

### Shortcode

对于 Shortcode，多余选项会被忽略，只有以下选项可用：

- `figure` 标签：
    - `id`、`class`：`id`、`class` 属性
    - `width`：加在 `style` 属性中
    - ~~`style`~~：不支持，需要修改样式可使用 `class` 选项 + 修改 CSS 文件的方式。
- `img` 标签：
    - `alt`：`alt` 属性，默认为 `kroki diagram`
    - `img-width`：作为 `width` 属性加在 `img` 标签上
- 其他：
    - `fancybox`：是否使用 fancybox
    - `title`：图像标题
    - `caption`：标题下的注释文字
    - `attr`：引用
