---
title: 2023-06-30 关于 Table 元素的几个问题
date: 2023-06-30T22:17:00+08:00
lastmod: 2023-06-30T22:52:51+08:00
comments: true
math: false
---

## `table` 元素的滚动和宽度的矛盾

在不改变 DOM 的前提下，要让一个 `table` 可以在超出父元素宽度时滚动，只能设置 `display:block`。然而，此时若想设置 `width: 100%` 使表格在宽度不足父元素宽度时拉伸到父元素的宽度，会发现虽然表格确实占用了 `100%` 的宽度（通过调试工具查看），但是表格内容却没有被拉伸。

要解决这个问题，可以为 `table` 添加一个父包裹元素

## `table` `caption` 的问题

`table` 元素中的 `caption` 可以用来展示表格标题和说明文字，但是 `display:sticky` 对其不生效。

目前只能用其他元素（如 `div`）替代 `caption` 元素。

[Daisilia 主题]({{< relref "Daisilia 主题#test-table" >}})
