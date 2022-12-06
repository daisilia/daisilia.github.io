---
title: "逆转 Grub 菜单中的 Linux Kernel 顺序"
date: 2022-11-23T00:22:02+08:00
lastmod: 2022-12-04T16:14:41+08:00
comments: true
math: false
tags:
    - Linux
    - Grub
---

当一个 Linux 系统（Arch Linux）上同时安装了多个 Kernel 时，貌似在 Grub 菜单中会将较新（指安装顺序，而不是版本顺序）的 Kernel 设置为默认内核。而现在要将较老的 Kernel 设置为默认。

<!--more-->

在同时安装了 `linux` 和 `linux-lts` 后，Grub 菜单如下（这里显示了子菜单内容）：

```xxx {linenos=false}
Arch Linux
Arch Linux 的高级选项
    Arch Linux，使用 Linux linux-lts
    Arch Linux, with Linux linux-lts (fallback initramfs)
    Arch Linux，使用 Linux linux
    Arch Linux, with Linux linux (fallback initramfs)
```

这里的第一项（`Arch Linux`）使用的是 `linux-lts`，你可以在 Grub 菜单按 <kbd>E</kbd> 键查看对应菜单项的详细信息。

要达到目的只需要修改 `/etc/grub.d/10_linux` 文件，去掉 `version_sort` 的 `-r` 参数（在 Arch Linux 系统中，在 207 行），然后再重新生成 `grub.cfg` 即可。

```bash {linenostart=207}
reverse_sorted_list=$(echo $list | tr ' ' '\n' | sed -e 's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -r | sed -e 's/ 1$/.old/; s/ 2$//')
```

↓↓↓

```bash {linenostart=207}
reverse_sorted_list=$(echo $list | tr ' ' '\n' | sed -e 's/\.old$/ 1/; / 1$/! s/$/ 2/' | version_sort -V | sed -e 's/ 1$/.old/; s/ 2$//')
```

接着使用 `grub-mkconfig` 命令重新生成 `grub.cfg`：

```bash {linenos=false}
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

{{% tab type="warning" summary="" details=false %}}
每次更新或重新安装 `grub` 会覆盖 `10_linux` 文件！上面所做的改变会被覆盖。
{{% /tab %}}

然后 Grub 菜单就会变成：

```xxx {linenos=false}
Arch Linux
Arch Linux 的高级选项
    Arch Linux，使用 Linux linux
    Arch Linux, with Linux linux (fallback initramfs)
    Arch Linux，使用 Linux linux-lts
    Arch Linux, with Linux linux-lts (fallback initramfs)
```

第一项（`Arch Linux`）的第一项已经变成了使用 `linux` 启动，且 `Arch Linux 的高级选项` 的子菜单项的顺序也变了。
