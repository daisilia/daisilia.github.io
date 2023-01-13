---
title: "常见问题处理"
date: 2023-01-13T17:08:03+08:00
lastmod: 2023-01-13T17:28:31+08:00
comments: true
math: false
tags:
    - Blender
---

关于 Blender 的一些常见问题的处理。

<!--more-->

## 使用独立显卡运行 Blender

在 Linux 系统上，如果在安装好了之后直接运行 Blender 或在终端输入 `blender` 命令运行 Blender，使用的是集成显卡而非独立显卡。在“编辑 → 偏好设置 → 编辑器 → 状态栏”开启“系统内存”和“显存”，可以在右下角状态栏看到，Blender 只使用了系统内存而没有使用显存。

{{< figure src="Blender 默认只使用集成显卡.png" title="Blender 默认只使用集成显卡" caption="" attribution="" alt="Blender 默认只使用集成显卡" class="" id="fig_blender-默认只使用集成显卡" >}}

要让 Blender 使用独立显卡，需要使用 `prime-run` 命令，如在终端输入 `prime-run blender` 命令，此时状态栏显示 Blender 使用了独立显卡。

{{< figure src="让 Blender 使用独立显卡.png" title="让 Blender 使用独立显卡" caption="" attribution="" alt="让 Blender 使用独立显卡" class="" id="fig_让-blender-使用独立显卡" >}}

如果要让直接打开的（如在应用程序启动器中打开的）Blender 使用独显，需按以下步骤操作。

1. 将默认 `blender.desktop` 复制一份到 `~/.local/share/applications/`
    ```bash
    mkdir -p ~/.local/share/applications/
    cp /usr/share/applications/blender.desktop ~/.local/share/applications/
    ```
2. 修改复制过来的 `blender.desktop` 文件，将 `Exec` 开头的那行改成
    ```desktop
    Exec=prime-run blender %f
    ```
