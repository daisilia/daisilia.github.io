---
title: "nvim-snippy 插件的 Snippet 语法"
date: 2023-06-09T18:06:22+08:00
lastmod: 2023-06-09T19:55:28+08:00
comments: true
math: false
tags:
    - NeoVim
---

## Tabstops

语法为 `$1`、`$2` 等，标志光标跳转的位置，使用时可通过快捷键，如 <kbd>Tab</kbd> 和 <kbd>Shift</kbd>+<kbd>Tab</kbd> 按数字递增顺序跳转。`$0` 比较特别，标志此代码片段的结束，是最后一个跳转位置。

## Placeholders

> Placeholders are [tabstops](#tabstops) with values.

语法为 `${1:foo}`，`foo` 为 placeholder 的默认文本，会在代码片段展开的时候插入到对应位置，跳转到该位置时，默认文本会被选中。Placeholders 可以嵌套，如 `${1:hello ${2:world}}`。

## 选项 {alias="Choice"}

语法为 `${1|one,two,three,with\, comma|}`，所有选项用 `|` 包围，选项之间用 `,` 分隔，当一个选项中包含 `,` 时，用 `\,` 替代。

## 变量 {alias="Variables"}

Snippy 支持一些预定义的变量，语法为 `$name` 或 `${name:default text}`，可用变量有：

- `TM_SELECTED_TEXT` 或 `VISUAL`：选中的文本
- `TM_CURRENT_LINE`：当前行
- `TM_CURRENT_WORD`：光标下的 word
- `TM_LINE_INDEX`：行号，从 0 开始
- `TM_LINE_NUMBER`：行号，从 1 开始
- `TM_FILENAME`：当前文件名
- `TM_FILENAME_BASE`：去掉扩展名的当前文件名
- `TM_DIRECTORY`：当前文件所在目录
- `TM_FILEPATH`：当前文件的完整路径

## 转换 {alias="Transform"}

Snippy 支持正则替换，语法为：

    ${<stop or variable>/<pattern>/<replacement>/<flags>}

如：

    This ${1:word} will be changed to uppercase: ${1/.*/\U\0/g}.

↓↓↓

    This hello will be changed to uppercase: HELLO.

Snippy 使用的正则语法为 Vim 的正则语法（比如 `\0`、`\{2,}`）而非 Javascript 正则语法（比如 `$0`）。


    ${1:word} → ${1/a\{2,}/\U\0/g}.

↓↓↓

    a,aa,ba,baa,a,aaa → a,AA,ba,bAA,a,AAA

## 表达式

Snippy 支持 Vimscript 和 Lua 两种表达式，语法为 `` `strftime('%c')` ``、`` `!lua os.date('%Y-%m-%d')` ``。Lua 表达式以 `!lua` 或 `!l` 开头；Vimscript 表达式不需要开头，但也可以以 `!vim` 或 `!v` 开头。
