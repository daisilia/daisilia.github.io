---
title: "Vue 学习记录"
date: 2021-12-30T13:08:28+08:00
lastmod: 2022-01-23T18:38:47+08:00
comments: true
math: false
weight: 1
tags:
    - Vue
categories:
---

## 前置知识

### `Object.defineProperty`

```javascript
let number = 20;
Object.defineProperty(person, 'age', {
    value: 18,              // 设置 person 对象中 age 属性的值
    enumerable: true,       // 设置 age 属性可枚举
    writable: true,         // 设置属性可写入
    configurable: true,     // 设置属性可删除
    get: function(){        // 读取 age 的值时，调用 get 函数
        young = number;
        number = number + 1;
        return young;
    },
    set: function(value){   // 给 age 赋值时，调用 set 函数
        number = value;
    },
})
```

## Vue Tips

1. 不要考虑如何操作 DOM，去考虑修改数据；
2. 网络应用开发：axios；

## `computed` 属性

`computed` 属性的 `get`（getter）和 `set`（setter）方法中的 `this` 被设置成指向 Vue 实例。

`computed` 属性会被缓存，模版中的多次请求只会调用一次对应属性的 `get` 方法。

`get` 方法会在两种情况下被调用：
1. 初次读取对应属性的值时；
2. <ins>所依赖的属性</ins>发生变化时。

`computed` 属性调用 `get` 方法后，将返回的值挂到 Vue 实例上。

`computed` 属性可以有 `set` 方法，在尝试修改属性值时会被调用。

`computed` 属性的两种写法：

1. 包含 `get`、`set`（可选）方法的对象：
    ```javascript
    computed: {
        fullName: {
            get(){
                // ...
            },
            set(){
                // ...
            },
        }
    }
    ```
2. 只需要 getter 时可简写：
    ```javascript
    computed: {
        fullName(){
            // ...
        }
    }
    ```
### 条件渲染

#### `v-show`

#### `v-if`、`v-else-if`和`v-else`

`v-if` 与 `template` 标签一起使用，在渲染结果中 `template` 标签会被去除。

### 添加新数据项

用类似 `vm._data.new_item = "value"` 的方法直接添加的数据不会经过 Vue 的处理（转换为 setter 和 getter）。正确方法是使用 [`Vue.set`](https://cn.vuejs.org/v2/api/#Vue-set) （或 `vm.$set`）方法。

Vue 通过包装数组的变更方法实现[数组更新监测](https://cn.vuejs.org/v2/guide/list.html#%E6%95%B0%E7%BB%84%E6%9B%B4%E6%96%B0%E6%A3%80%E6%B5%8B)，修改数组对象必须调用[这些方法](https://cn.vuejs.org/v2/guide/list.html#%E5%8F%98%E6%9B%B4%E6%96%B9%E6%B3%95)或使用 [`Vue.set`](https://cn.vuejs.org/v2/api/#Vue-set) 方法。

{{% tab type="success" summary="" details=false open=true %}}
注意：出于编写方便考虑，Vue 将 `vm._data` 中的数据项挂载到了 `vm` 上面。因此，使用上述方法时，可用 `vm.new_item` 代替 `vm._data.new_item`。
{{% /tab %}}

## 表单提交

### Checkbox

```html
<input type="checkbox" value="game" v-model="hobbies">
<input type="checkbox" value="fishing" v-model="hobbies">
<input type="checkbox" value="movie" v-model="hobbies">
```

其中 `hobbies` 变量应该为一个数组。

### 表单提交的默认行为及提交内容

为 `form` 标签设置 `@submit.prevent="submitForm"`。

可以直接使用 `JSON.stringify(this.user_info)` 将 `user_info` 转换为 JSON 字符串，便于提交给服务端。

### 强制数字输入

```html
<label for="age">年龄：</label>
<input type="number" id="age" v-model.number="user_info.age">
```

关于两个 `number`：前者使输入框只能输入数字，后者保证 `user_info.age` 的类型为数字。

### `v-model` 常用修饰符

- `number`：见[强制数字输入](#强制数字输入)。
- `lazy`：只在元素失去焦点时同步。
- `trim`：去除首尾空格。

## 过滤器

### 全局过滤器

通过 [Vue.filter]() 可注册全局过滤器，可供所有 Vue 实例使用。

## 自定义指令

### 简单的自定义指令

通过 `directives` 项添加自定义指令。

```javascript
// ...
directives: {
    big(element, binding){
        element.innerText = binding.value * 100;
    },
    'big-number': function(element, binding){
        element.innerText = binding.value * 100;
    },
    'big-number'(element, binding){
        element.innerText = binding.value * 100;
    }
}
// ...
```

自定义指令会在以下情况下被调用：
1. 指令与元素成功绑定时（尚未放入页面）。
2. 指令所在的模版被重新解析时。

{{% tab type="info" summary="" details=false open=true %}}
注意指令函数中的 `this` 不是 Vue 实例。因此指令函数可以写成箭头函数。
{{% /tab %}}

### 详细的自定义指令

```javascript
// ...
fbind:{
    // 指令与元素成功绑定
    bind(element, binding){
        element.value = binding.value;
    },
    // 指令与元素成功绑定时
    inserted(element, binding){
        // ...
    },
    // 指令所在模版刷新时
    update(element, binding){
        element.value = binding.value;
    }
}
// ...
```

### 全局自定义指令

定义全局指令的方法类似定义全局过滤器，使用 `Vue.directive` 方法。

## 生命周期函数

{{% sa %}}[Vue 生命周期图示](https://v3.cn.vuejs.org/guide/instance.html#%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F%E5%9B%BE%E7%A4%BA){{% /sa %}}

### 挂载

Vue 在完成模版的解析并把真是的 DOM 元素放入到页面中（挂载完毕）后，调用 `mounted` 函数。

### 销毁

在销毁流程中的任何时间点，所做数据更改不会触发 DOM 更新。

#### `beforeDestory`

#### `destoryed`
