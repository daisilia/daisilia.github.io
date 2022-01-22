---
title: "Vue 组件化"
date: 2022-01-04T16:55:54+08:00
lastmod: 2022-01-04T18:21:05+08:00
comments: true
math: false
weight: 1
tags:
    - Vue
categories:
---

## 注意事项

1. 组件初始化所用的配置对象中没有 `el` 选项。
2. 组件中的 `data` 配置项中的“数据”要写成函数。

### 关于组件起名

组件名推荐写法：

1. 一个单词：`school`、`School`。
2. 多个单词：`myschool`、`"my-school"`、`MySchool`（需要脚手架）。

{{% tab type="warning" summary="" details=false open=true %}}
尽量回避 HTML 中内置的标签名（注意 HTML 忽略大小写）。
{{% /tab %}}

{{% tab type="info" summary="" details=false open=true %}}
在组件配置对象中使用 `name` 配置项可指定组件在 Vue 开发工具中显示的名称。
{{% /tab %}}

## 基本语法

```javascript
// 1. 创建组件
const childComponent = Vue.extend({
    template: `
        <div class="child">
            姓名：<input type="text" name="姓名" v-model="auther.name">
            邮箱：<input type="text" name="邮箱" v-model="auther.email">
        </div>
    `,
    data: function(){
        return {
            auther: {
                name: 'melody',
                email: 'melody@163.com',
            },
            // ...
        }
    },
    // ...
})

new Vue({
    el: '#root',
    // 2. 注册组件（局部注册）
    components: {
        // childComponent,
        child: childComponent,
    },
})
```

然后在 HTML 中添加组件标签：

```html
<div id="root">
    <!-- 挂载组件 -->
    <child></child>
    <child/><!-- 注意 Vue 脚手架才能正确处理好多个自闭合标签 -->
</div>
```

{{% tab type="info" summary="注册全局组件" details=false open=true id="tab_注册全局组件" %}}
注册全局组件的方法与注册全局过滤器、全局自定义指令的方法类似，使用 `Vue.component` 方法。
{{% /tab %}}

{{% tab type="info" summary="" details=false open=true %}}
Vue 也可以直接用组件配置对象作为 `components` 中的组件的值，即上述对应代码可简写为：

```javascript
const childComponent = {
    template: /* ... */,
    data: function(){
        return {
            // ...
        }
    },
    // ...
}
```
{{% /tab %}}

## 组件嵌套

```javascript
const coc = {
    template: `
        <div class="child">
            <p>信息：{{mes}}</p>
        </div>
    `,
    data: function(){
        return {
            mes: "hello",
            // ...
        }
    },
}

// 1. 创建组件
const childComponent = Vue.extend({
    // ...
    components: {
        'child-of-child': coc,
    },
    // ...
})
```
