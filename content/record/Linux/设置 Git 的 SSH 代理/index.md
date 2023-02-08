---
title: "设置 Git 的 SSH 代理"
date: 2022-12-06T19:39:17+08:00
lastmod: 2023-02-08T18:32:23+08:00
comments: true
math: false
tags:
    - Git
    - 代理
---

不同于 http/https 代理，为 git 设置代理不需要修改 `~/.gitconfig` 文件或使用 `git config` 命令，或者说，这样设置没有效果。

<!--more-->

修改 `~/.ssh/config` 文件，示例：

```
Host github.com
    Hostname github.com
    ServerAliveInterval 60
    ForwardAgent yes
    ProxyCommand /usr/bin/corkscrew 127.0.0.1 8889 %h %p
```

最后一行需要修改，`127.0.0.1` 可更改为其他代理服务器地址，`8889` 可改为其他端口号，根据自己的代理设置更改即可。

需要注意的是，代理协议为 `http`，没有启用的需启用 `http` 代理。以 Linux 下的 Qv2ray 为例，进入 “首选项” \> “入站设置”，按下图设置。

{{< figure src="http_代理设置.png" title="http 代理设置" caption="" alt="http 代理设置" class="" >}}
