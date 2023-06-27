---
title: 2023-06-27
date: 2023-06-27T12:17:46+08:00
lastmod: 2023-06-27T15:09:03+08:00
comments: true
math: false
---

<!--more-->

## Javascript 获取元素相对位置

### 相对父元素的位置

获取一个元素相对于父元素的位置（Offset）：

```javascript
$0.offsetTop
$0.offsetLeft
// $0.offsetBottom 不存在
// $0.offsetRight  不存在
```

“父元素”可以通过 `$0.offsetParent` 确认。

### 相对任意一个元素的位置

要获取一个元素相对另一个元素的位置，可以使用 `getBoundingClientRect` 函数：

```javascript
function offset(e1, e2) {
    return {
        "top": e1.getBoundingClientRect().top - e2.getBoundingClientRect().top,
        "left": e1.getBoundingClientRect().left - e2.getBoundingClientRect().left,
    };
}
```

### 相对窗口的位置


