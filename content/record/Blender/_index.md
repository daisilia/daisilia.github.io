---
title: "Blender"
date: 2023-01-10T21:01:11+08:00
lastmod: 2023-01-10T22:38:47+08:00
comments: true
math: false
tags:
    - Blender
---

## 常用快捷键及相关操作

### 小键盘

- <kbd>0</kbd>：摄像机视角
- <kbd>5</kbd>：正交视图
- 切换三视图，注意 7、1、3 在小键盘的布局与四视图中对应视图的布局相同
    - <kbd>7</kbd>：顶视图（Z）
    - <kbd>1</kbd>：前视图（-Y）
    - <kbd>3</kbd>：右视图（X）
- 切换与对应视图相反的视图，加上 <kbd>Ctrl</kbd> 即可，如仰视图（-Z）快捷键为 <kbd>Ctrl</kbd>+<kbd>7</kbd>
- <kbd>9</kbd>：视角翻转，即前两项之间相互切换；或在透视/正交视角中翻转 X 和 Y 轴
- <kbd>.</kbd>：聚焦
- <kbd>Ctrl</kbd>+<kbd>.</kbd>：四视图同步聚焦
- <kbd>HOME</kbd>：显示整个场景

### 常规按键

- <kbd>/</kbd>：聚焦且进入局部视图（隐藏其他物体）
- <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>0</kbd>：移动摄像机到当前视角
- <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Q</kbd>：进入四视图
- <kbd>N</kbd>：打开工具面板
- <kbd>W</kbd>：切换选择工具
- <kbd>A</kbd>，<kbd>A</kbd><kbd>A</kbd>：全选，取消全选
- <kbd>Shift</kbd>+<kbd>A</kbd>：添加物体
- <kbd>X</kbd>：删除物体
- <kbd>I</kbd>：【动画】打帧

旋转/缩放/移动：

- <kbd>R</kbd><kbd>S</kbd><kbd>G</kbd>：旋转/缩放/移动
    - 开启旋转后，<kbd>R</kbd> 切换自由旋转和在当前视平面旋转
- 通用二级按键
    - <kbd>X</kbd>/<kbd>Y</kbd>/<kbd>Ζ</kbd>：锁定在轴上旋转/缩放/移动
        - 锁定后可直接输入数字选择移动距离/缩放倍数/旋转角度
    - <kbd>Shift</kbd>+<kbd>X</kbd>/<kbd>Y</kbd>/<kbd>Ζ</kbd>：锁定在与轴垂直的平面上旋转/缩放/移动（对旋转无区别）
    - <kbd>MiddleClick</kbd>：选择并锁定在轴上旋转/缩放/移动
    - <kbd>Shift</kbd>：精确模式
    - <kbd>RightClick</kbd>：取消
- <kbd>Alt</kbd>+<kbd>R</kbd><kbd>S</kbd><kbd>G</kbd>：归零旋转/缩放/移动


## 基本操作

- 调整摄像机/保持摄像机视角：视图 → 视图锁定 → 勾选“锁定摄像机到视图方位”
- 摄像机视框大小/输出分辨率：左下角工具栏 → 输出属性（照片打印机图标） → 格式 → 分辨率 X/Y
- 选中物体时自动显示移动/旋转/缩放工具：视图 Gizmo（视图框右上角第二个图标）→ 下拉 → 移动/旋转/缩放
