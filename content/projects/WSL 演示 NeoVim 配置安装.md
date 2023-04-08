---
title: "WSL 演示 NeoVim 配置安装"
date: 2022-04-25T23:26:17+08:00
lastmod: 2023-04-09T01:30:09+08:00
comments: true
math: false
tags:
    - NeoVim
    - WSL
---

B 站视频[【WSL + NeoVim】WSL 演示 NeoVim 配置安装](https://www.bilibili.com/video/BV1C44y1g7Sg/)，中的演示文稿。

<!--more-->

{{< bilibili bvid="1C44y1g7Sg" >}}

## 准备工作

- ArchWSL，两种方式下载：
  - GitHub：[https://github.com/yuk7/ArchWSL](https://github.com/yuk7/ArchWSL)
  - 镜像：[https://gitee.com/yuk7/archwsl-mirror](https://gitee.com/yuk7/archwsl-mirror)
- Windows Terminal： Microsoft Store 里搜索、安装就行

## 开始安装

### 安装 ArchWSL

#### 1. 启用 WSL

Win+R，输入 optionalfeatures.exe，回车，勾选“适用于 Linux 的 Windows 子系统”，点击“确定”。

#### 2. 开始安装 ArchWSL

不一定要是 ArchWSL，只不过我比较习惯用 ArchLinux。

- README：[https://github.com/yuk7/ArchWSL/blob/master/i18n/README_zh-cn.md](https://github.com/yuk7/ArchWSL/blob/master/i18n/README_zh-cn.md)
- ArchWSL documentation - 如何安装：[https://wsldl-pg.github.io/ArchW-docs/locale/zh-CN/How-to-Setup/](https://wsldl-pg.github.io/ArchW-docs/locale/zh-CN/How-to-Setup/)

在 PowerShell 里：

```powershell
arch.exe         # 初始化 ArchWSL
wsl -l -v        # 查看 ArchWSL 信息
wsl              # 进入 ArchWSL
```

{{< tab type="default" summary="备用命令" details=true open=true >}}
```powershell
wsl --set-version arch 2 # 设置 ArchWSL 的 WSL 版本
wsl --set-default arch   # 设置 WSL 的默认发行版为 ArchWSL
```
{{< /tab >}}

进入了 ArchWSL：

配置 pacman：

- 中科大 Arch Linux 源：[https://mirrors.ustc.edu.cn/help/archlinux.html](https://mirrors.ustc.edu.cn/help/archlinux.html)
- 中科大 Arch Linux CN 源：[https://mirrors.ustc.edu.cn/help/archlinuxcn.html](https://mirrors.ustc.edu.cn/help/archlinuxcn.html)

安装 zsh，配置用户：

```bash
passwd                                               # 设置 root 密码
pacman -S archlinuxcn-keyring                        # archlinuxcn 签名
pacman -Syyu                                         # 更新软件
pacman -S zsh                                        # 安装 zsh
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel   # 使 wheel 组的用户能使用 sudo
useradd {username} -m -G wheel -s /usr/bin/zsh       # 添加用户
passwd {username}                                    # 设置新用户密码
exit                                                 # 退出 WSL
```

回到了 PowerShell：

```powershell
Arch.exe config --default-user {username}            # 设置默认用户
```

## 我的 NeoVim 配置

### 配置 git

```bash
sudo pacman -S git  # 安装 Git
```

#### 配置 Git 代理

{{< tab type="default" summary="" >}}
懂的都懂，不懂的话请[跳过这一步](#安装-neovim-及配置)。
{{< /tab >}}

创建可执行文件：

```bash
echo "export PATH=\$PATH:\$HOME/.local/bin" >> ~/.zshrc
mkdir -p ~/.local/bin
touch ~/.local/bin/pxy
chmod +x ~/.local/bin/pxy
```

将以下内容写入 `~/.local/bin/pxy`（或其他 `PATH` 目录下的文件）：

```bash
#!/usr/bin/env zsh
hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
protocol='socks5'     # 这里可以换成其他协议
port=10808            # 这里可以换成其他端口号

PROXY_HTTP="${protocol}://${hostip}:${port}"

set_proxy(){
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"
    export https_proxy="${PROXY_HTTP}"
    export HTTPS_PROXY="${PROXY_HTTP}"

    git config --global http.proxy ${PROXY_HTTP}
    git config --global https.proxy ${PROXY_HTTP}

    # 使用 proxychains 的话，取消下面这行的注释
    # sudo sed /etc/proxychains.conf -i -e "s/^socks.*$/${protocol}:\/\/${hostip}:${port}/"
}

unset_proxy(){
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

if [ "$1" = "set" ]
then
    set_proxy
elif [ "$1" = "unset" ]
then
    unset_proxy
else
    echo "Unsupported arguments."
fi
```

然后就可以通过 `pxy set` 和 `pxy unset` 设置和取消设置 proxy。

#### 安装 NeoVim 及配置

```bash
sudo pacman -S neovim  # 安装 NeoVim
```

安装配置：[https://github.com/alohaia/nvimcfg](https://github.com/alohaia/nvimcfg)

#### 安装依赖

```bash
sudo pacman -S gcc fzf ripgrep python
```

win32yank：[https://github.com/equalsraf/win32yank](https://github.com/equalsraf/win32yank)。下载，解压到桌面，运行以下命令：

```bash
sudo mv {/path/to/win32yank.exe} /usr/bin
```

{{< tab type="default" summary="" >}}
路径一般为 `/mnt/c/Desktop/win32yank.exe`，视频中我的路径不是这个是因为我把桌面移到了 E 盘。
{{< /tab >}}

安装 Python 的 neovim 模块：

```bash
sudo pacman -S python-pip
python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install neovim
```

安装 language server：[https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)。根据需要安装，或使用以下命令安装所有配置了的 language server（部分包可用 npm 安装，这里全部使用 pacman/paru 安装）：

```bash
sudo pacman -S clang lua-language-server bash-language-server vscode-css-languageserver vscode-json-languageserver vscode-html-languageserver
pip install pyright

# eslint，js、ts 的 language server。
# 下载很慢，需要 proxy
sudo pacman -S paru
paru -S vscode-eslint-language-server

# R lauguage server
sudo pacman -S r make
sudo R
# 然后在 R 中运行指令：install.packages("languageserver")
```

#### 安装字体

Nred fonts：[https://www.nerdfonts.com/font-downloads](https://www.nerdfonts.com/font-downloads)

设置 Windows terminal 字体：设置 => Arch => 外观 => 字体 => 选择 "JetBrainsMono Nerd Font" => 保存。

#### 关于我的配置

如果你要用我的配置：

- 建议禁用 hugowiki.vim，安装其他的 Markdown 插件，这是我自己写的一个自用插件。
- 我的配置自带一个 packer，插件安装、配置的方法和其他的插件管理器不太一样，详见 [README(CN)](https://github.com/alohaia/nvimcfg/blob/lua/README_cn.md)。
    - 命令有：
        - `PackInstall`：安装未安装且 `disable != true` 的插件；
        - `PackUpdate`：安装未安装且 `disable != true` 的插件，并更新所有已安装且 `disable != true` 的插件；
        - `PackClean`：清除所有不在配置中或 `disable == true` 的插件；
        - `PackSync`：相当于 `PackClean`，`PackUpdate`。
    - 配置文件：
        - `~/.config/nvim/init.lua`：加载其他配置，并包含一些全局设置；
        - `~/.config/nvim/lua/aloha/plugins.lua`：插件列表（及简单配置）；
        - `~/.config/nvim/lua/aloha/plugin_configs.lua`：插件的详细配置，相应配置只有在对应插件已安装且 `disable != true` 的时候才会加载。
