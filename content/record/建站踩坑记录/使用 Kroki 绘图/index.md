---
title: "使用 Kroki 绘图"
date: 2023-02-08T19:51:46+08:00
lastmod: 2023-02-12T20:56:53+08:00
comments: true
math: false
---

在提交 [3d3c075](https://github.com/alohaia/hugo-theme-daisilia/commit/3d5c0756970b3986ab3f0f8810921f8458592f8b) 中，添加了利用 Kroki 绘图的功能。

方法参考自 [Hugo discourse - Is there some pre-packaged way to use Kroki from markdown?](https://discourse.gohugo.io/t/is-there-some-pre-packaged-way-to-use-kroki-from-markdown/36924/5)。

<!--more-->

{{< figure src="kroki_cheatsheet_20210515_v1.1_EN.png" title="Kroki Cheatsheet" attr="Cheat sheet v.1.1 · 2021/05/15 · created by Tomo Masuda // @tomo-makes https://kroki.io/ · https://github.com/yuzutech/kroki" alt="Kroki Cheatsheet" id="fig_kroki_cheatsheet_20210515_v1.1_en" >}}

## 代码块和 Shortcode

提交 [063c974](https://github.com/alohaia/hugo-theme-daisilia/commit/063c974720900f1033b222469a4c757d7889ca62) 中的关键文件有两个——`layouts/_default/_markup/render-codeblock-kroki.html` 和 `layouts/shortcodes/kroki.html`，前者将 `kroki` 代码块替换为 SVG 图像，后者则使用 Hugo 的 shortcode 功能。

````
```kroki {#TEST1 type=actdiag title="Title" caption="caption" attr="Attributions"}
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

```kroki {#TEST1 type=actdiag title="Title" caption="caption" attr="Attributions"}
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
{{</* kroki type="actdiag" title="ActDiag" caption="**This** is *caption*." attr="Hugo discourse - Is there some pre-packaged way to use Kroki from markdown?">}}
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

{{< kroki type="actdiag" title="ActDiag" caption="**This** is *caption*." attr="Hugo discourse - Is there some pre-packaged way to use Kroki from markdown?">}}
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


```xxx
{{</* kroki type="excalidraw" file="hand-written.excalidraw.json" >}}{{< /kroki */>}}
```

↓↓↓

{{< kroki type="excalidraw" file="hand-written.excalidraw.json" >}}{{< /kroki >}}

```xxx
{{%/* kroki type="vega" file="bar-chart.vega.json" %}}{{% /kroki */%}}
```

↓↓↓

{{< kroki type="vega" file="bar-chart.vega.json" >}}{{< /kroki >}}

在图表中插入超链接：

```xxx
{{%/* kroki type="plantuml" %}}
actor Bob
actor "This is [[http://plantuml.com/sequence Alice]] actor" as Alice
Bob -> Alice [[{{< relref "/about" >}}]] : hello
note left [[http://plantuml.com/start]]
  a note with a link
end note
Alice -> Bob : hello with [[http://plantuml.com/start{Tooltip for message} some link]]
note right [[http://plantuml.com/start]] : another note
note left of Bob
You can use [[http://plantuml.com/start links in notes]] also.
end note
{{% /kroki */%}}
```

{{% kroki type="plantuml" %}}
actor Bob
actor "This is [[http://plantuml.com/sequence Alice]] actor" as Alice
Bob -> Alice [[{{< relref "/about" >}}]] : hello
note left [[http://plantuml.com/start]]
  a note with a link
end note
Alice -> Bob : hello with [[http://plantuml.com/start{Tooltip for message} some link]]
note right [[http://plantuml.com/start]] : another note
note left of Bob
You can use [[http://plantuml.com/start links in notes]] also.
end note
{{% /kroki %}}

```xxx
{{%/* kroki type="plantuml" id="TEST" %}}
@startmindmap
* [[{{< relref "/about" >}} about]]
@endmindmap
{{% /kroki */%}}
```

{{% kroki type="plantuml" id="TEST" %}}
@startmindmap
* [[{{< relref "/about" >}} about]]
@endmindmap
{{% /kroki %}}

## 可用选项

### 代码块

传递给代码块的属性（Attributions），如 `id`、`style` 会全部原封不动地加在 `figure` 标签上，除了以下几个需要注意：

- `type` 会被忽略
- `width` 会被放进 `style` 属性中
- `class` 的开头会加上 `diagram-kroki diagram-kroki-{type}`，`{type}` 即 `type` 属性
- `img-width` 会作为 `width` 加在 `embed` 标签的 `style` 属性中
- `attr`、`title`、`caption`：同 [Shortcode](#shortcode)

### Shortcode

对于 Shortcode，多余选项会被忽略，只有以下选项可用：

- `figure` 标签：
    - `id`、`class`：`id`、`class` 属性
    - `width`：加在 `style` 属性中
    - ~~`style`~~：不支持，需要修改样式可使用 `class` 选项 + 修改 CSS 文件的方式。
- `embed` 标签：
    - `img-width`：作为 `width` 加在 `embed` 标签的 `style` 属性中上
- 其他：
    - `title`：图像标题
    - `caption`：标题下的注释文字
    - `attr`：引用

## 工具和语法参考

工具：

- 在线编辑器：[Niolesk: Edit **diagrams** from **textual** descriptions! A kroki interface.](https://niolesk.top/)。
- 示例：[https://kroki.io/examples.html](https://kroki.io/examples.html)

语法参考：

- Diagram
    - Block diagram（`blockdiag`），Sequence diagram（`seqdiag`）、Activity diagram（`actdiag`）、Network diagram（`nwdiag`）、Packet diagram（`packetdiag`）、Rack diagram（`rackdiag`）：[blockdiag 1.0 documentation](http://blockdiag.com/en/index.html#table-of-contents)
    - Mermaid（`mermaid`）：[Diagram Syntax | Mermaid](https://mermaid.js.org/intro/n00b-syntaxReference.html)
    - Nomnoml（`nomnoml`）：[nomnoml](https://stage.nomnoml.com/)，[nomnoml(legacy)](https://nomnoml.com/)
    - PlantUML（`plantuml`）：[PlantUML](https://plantuml.com/zh/)
    - Pikchr（`pikchr`）：[Pikchr User Manual](https://pikchr.org/home/doc/trunk/doc/userman.md)
    - Vega（`vega`）：[Vega – A Visualization Grammar](https://vega.github.io/vega/)
    - Vega-Lite（`vegalite`）：[Vega-Lite – A Grammar of Interactive Graphics](https://vega.github.io/vega-lite/)
    - Third-party
        - Excalidraw - Hand-drawn like diagrams（`excalidraw`）：[Excalidraw](https://excalidraw.com/)
    - Entity Relationship Diagram（`erd`）
    - Object Oriented Graph（`graphviz`）
- Visualization：
    - Conjugate prior relationships（`ditta`）：[stathissideris/ditaa](https://github.com/stathissideris/ditaa#syntax)，[ditta](https://ditaa.sourceforge.net/)
