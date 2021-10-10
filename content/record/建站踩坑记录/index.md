---
title: "建站踩坑记录"
date: 2021-10-10T23:30:20+08:00
---

这篇文章记录了开始用 Hugo 作为静态网站生成器后的踩坑记录，包括写主题和网站布署等方面。

<!--more-->

## 将仓库子目录作为网站根目录

如果你已经了解情况，那么参考下面的命令，你的问题就应该解决了：

```bash
git subtree push --prefix public daisilia blog
```

如若不然，让我们先来了解一下情况：
- 有一个用 `hugo new site` 生成的网站源码目录 `blog.hugo`，并在 `blog.hugo` 初始化了一个 GitHub 仓库；
    ```bash
    hugo new site blog.hugo && cd blog.hugo
    # ... 添加内容并使用 hugo 命令生成 public/ 目录
    git init .
    git add . && git commit -m "Init"
    ```
- 添加 `git@github.com:daisilia/daisilia.github.io.git` 为 remote `daisilia`，并做一次提交：
    ```bash
    git remote add daisilia git@github.com:daisilia/daisilia.github.io.git
    git push -u daisilia
    ```

最后运行一开始提到的命令，将 `public` 目录提交为 `blog` 分支：

```bash
git subtree push --prefix public daisilia blog
```

最后再到 https://github.com/daisilia/daisilia.github.io 进入 Pages 设置界面，将 `blog` 分支设置为要用的分支即可。

![Pages 设置](pages.png)

## 将主题添加为子模块

这里已经将远程仓库 https://github.com/alohaia/hugo-theme-daisilia 克隆到 `blog.hugo/themes/daisilia`，执行以下命令即可将其添加为子模块。

```bash
git submodule add https://github.com/alohaia/hugo-theme-daisilia.git themes/daisilia
```

