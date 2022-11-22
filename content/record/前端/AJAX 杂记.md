---
title: "AJAX 杂记"
date: 2021-12-31T16:35:23+08:00
lastmod: 2021-12-31T16:48:02+08:00
comments: true
math: false
weight: 1
tags:
    - AJAX
    - 前端
categories:
---

AJAX（Asynchronous JavaScript and XML，异步的 JavaScript 与 XML 技术）
: AJAX 是一种在无需重新加载整个网页的情况下，能够更新部分网页的技术。[^菜鸟教程]
: AJAX 指的是一套综合了多项技术的浏览器端网页开发技术。AJAX 应用可以仅向服务器发送并取回必须的数据，并在客户端采用 JavaScript 处理来自服务器的回应。因为在服务器和浏览器之间交换的数据大量减少，服务器回应更快了。同时，很多的处理工作可以在发出请求的客户端机器上完成，因此 Web 服务器的负荷也减少了。[^维基百科]

[^菜鸟教程]: https://www.runoob.com/php/php-ajax-intro.html
[^维基百科]: https://zh.wikipedia.org/wiki/AJAX

<!--more-->

## AJAX 的实现方式

1. `XMLHttpRequest`
2. `JQuery`
3. `Axios`
4. `fetch`

## AJAX 跨域请求

AJAX 默认不支持跨域请求，可以通过几种方法实现跨域请求。

### JSONP

Jsonp（JSON with Padding）是 json 的一种“使用模式”，可以让网页从别的域名（网站）那获取资料，即跨域读取数据。
