---
title: "Daisilia 主题"
date: 2023-05-21T14:49:37+08:00
lastmod: 2023-08-01T11:33:48+08:00
comments: true
math: false
---

## Shortcodes

### Bilibili 视频 {alias="bilibili"}

```html
{{</* bilibili id=av2 autoplay=false */>}}
```

{{< bilibili id=av2 autoplay=false >}}

- `id`：AV 或 BV 号
- `page`：视频分 P，如 P2 就是 `page=2`
- `autoplay`：是否自动播放

### 图片 {alias="figure"}

{{< figure src="Linus Torvalds.jpg" title="Linus Torvalds" caption="林纳斯·托瓦兹于2014年LinuxCon Europe大会演讲" attr="由Krd - 自己的作品，CC BY-SA 4.0，https://commons.wikimedia.org/w/index.php?curid=36166670" alt="Linus Torvalds" class="float-right" id="fig_linus-torvalds" >}}

```html
{{</* figure src="Linus Torvalds.jpg"
title="Linus Torvalds"
caption="林纳斯·托瓦兹于2014年LinuxCon Europe大会演讲"
attr="由Krd - 自己的作品，CC BY-SA 4.0，https://commons.wikimedia.org/w/index.php?curid=36166670"
alt="Linus Torvalds"
class="float-right"
id="fig_linus-torvalds" */>}}
```

- `id`
- `fancybox`
- `src`
- `class`：float-right/float-left/right/left
- `width`：图片整体（包括标题等）的宽度
- `embed`
- `link`（与 `fancybox` 冲突）：点击图片跳转的链接
- `target`（需要 `link`）：默认为 "_blank"
- `title`：图片标题
- `alt`
- `img-width`：图片的宽度
- `caption`：图片说明文字，可使用 Markdown 语法
- `attr`：图片引用说明

### 隐藏文字 {alias="hdt"}

```
{{</* hdt "I can ***ALWAYS*** find you~~" */>}}
```

{{< hdt "I can ***ALWAYS*** find you~~" >}}

### 水平列表 {alias="行内列表 hzl"}

```html
1. {{</* hzl */>}}苹果、|李子、|梨{{</* /hzl */>}}
2. {{</* hzl sep="@" */>}}苹果、@李子、@梨{{</* /hzl */>}}
3. {{</* hzl */>}}苹果、|李子、|梨|_或|桃子{{</* /hzl */>}}
4. {{</* hzl start=2 */>}}李子、|梨|_或|桃子{{</* /hzl */>}}
```

1. {{< hzl >}}苹果、|李子、|梨{{< /hzl >}}
2. {{< hzl sep="@" >}}苹果、@李子、@梨{{< /hzl >}}
3. {{< hzl >}}苹果、|李子、|梨|_或|桃子{{< /hzl >}}
4. {{< hzl start=2 >}}李子、|梨|_或|桃子{{< /hzl >}}

### Kroki {alias="kroki"}

见使用 Kroki 绘图。

### 引用 {alias="quote"}

```html
{{</* quote author="宋代·杨万里" work="《夏夜追凉》" align="center" link="https://so.gushiwen.cn/shiwenv_2d549d9a09f4.aspx" */>}}
竹深树密虫鸣处，时有微凉不是风。
{{</* /quote */>}}

> 简单引用
```

{{< quote author="宋代·杨万里" work="《夏夜追凉》" align="center" link="https://so.gushiwen.cn/shiwenv_2d549d9a09f4.aspx" >}}
竹深树密虫鸣处，时有微凉不是风。
{{< /quote >}}

> 简单引用

### Section 标题 {alias="section"}

```html
{{</* section */>}}临床应用{{</* /section */>}}

1. **青光眼**：低浓度毛果芸香碱滴眼，能使瞳孔括约肌收缩，前角肌间隙增大，房水回流通畅，可治疗**闭角性青光眼**（充血性青光眼）；对开角性青光眼（单纯型青光眼）也有一定疗效，但机制未明。
2. 虹膜睫状体炎：注意与扩瞳药交替使用，避免虹膜与晶状体粘连。
3. 对抗扩瞳药：术后或验光检查应用扩瞳药后，用毛果芸香碱缩瞳。

```

{{< section >}}临床应用{{< /section >}}

1. **青光眼**：低浓度毛果芸香碱滴眼，能使瞳孔括约肌收缩，前角肌间隙增大，房水回流通畅，可治疗**闭角性青光眼**（充血性青光眼）；对开角性青光眼（单纯型青光眼）也有一定疗效，但机制未明。
2. 虹膜睫状体炎：注意与扩瞳药交替使用，避免虹膜与晶状体粘连。
3. 对抗扩瞳药：术后或验光检查应用扩瞳药后，用毛果芸香碱缩瞳。

### 标签卡 {alias="tab"}

```html
{{</* tab type="default" summary="tab1" details=true open=true id="tab_tab1" */>}}
标签卡 1
{{</* /tab */>}}

{{</* tab type="info" summary="tab2" details=true open=false */>}}
标签卡 2
{{</* /tab */>}}

{{</* tab type="error" summary="tab3" details=false */>}}
标签卡 3
{{</* /tab */>}}

{{</* tab type="warning" */>}}
标签卡 4

[标签卡 1](#tab_tab1)中提到了“标签卡 1”
{{</* /tab */>}}
```

{{< tab type="default" summary="tab1" details=true open=true id="tab_tab1" >}}
标签卡 1
{{< /tab >}}

{{< tab type="info" summary="tab2" details=true open=false >}}
标签卡 2
{{< /tab >}}

{{< tab type="error" summary="tab3" details=false >}}
标签卡 3
{{< /tab >}}

{{< tab type="warning" >}}
标签卡 4

[标签卡 1](#tab_tab1)中提到了“标签卡 1”
{{< /tab >}}

### 表格 {alias="table"}

```xxx title url link_text
{{</* table title="表格标题" caption="说明文字" attr="引用说明" id="test-table" */>}}
... Markdown 表格内容 ...
{{</* /table */>}}
```

{{< table title="表格标题" caption="说明文字" attr="引用说明" id="test-table" >}}
|                  |               溶组织内阿米巴              |                        蓝氏贾第鞭毛虫                        |             阴道毛滴虫             |                 疟原虫                |             刚地弓形虫             |    隐孢子虫    |
|:----------------:|:-----------------------------------------:|:------------------------------------------------------------:|:----------------------------------:|:-------------------------------------:|:----------------------------------:|:--------------:|
|     感染阶段     |             成熟包囊/四核包囊             |                       成熟包囊/四核包囊                      |               滋养体               |        子孢子（雌性按蚊唾液腺）       |          卵囊（含子孢子）          |      卵囊      |
|     感染方式     |                    经口                   |                             经口                             |      直接（性接触）、间接接触      |        {{% hzl "@" %}}蚊媒叮咬@输血@垂直传播{{% /hzl %}} |       多种水平传播及垂直传播       |      经口      |
|   ~~体内移行~~   |                     -                     |                               -                              |                  -                 |                   -                   |                  -                 |        -       |
|     寄生部位     |            大肠<br/>肝、肺、脑            |                           小肠上段                           | 男、女泌尿生殖道（**阴道后穹隆**） | 红细胞 | 所有有核细胞（~~红细胞~~）和组织内 |        -       |
|     离体途径     | 滋养体随患者脓血便<br/>包囊随带虫者成形便 |           滋养体随患者水样便<br/>包囊随带虫者成形便          |          泌尿生殖道分泌物          |                   -                   |                  -                 |        -       |
|      终宿主      |              人（人际传播型）             |                       人（人际传播型）                       |          人（人际传播型）          |                  按蚊                 |   猫及其他猫科动物（肠上皮细胞）   |        -       |
|   第一中间宿主   |                     -                     |                               -                              |                  -                 |                   人                  |            人和所有动物            |        -       |
| ~~第二中间宿主~~ |                     -                     |                               -                              |                  -                 |                   -                   |                  -                 |        -       |
|   ~~保虫宿主~~   |                     -                     |                               -                              |                  -                 |                   -                   |                  -                 |        -       |
|   ~~转续宿主~~   |                     -                     |                               -                              |                  -                 |                   -                   |                  -                 |        -       |
|     所致疾病     |        肠阿米巴病<br/>肠外阿米巴病        |                            脂肪痢                            |   泌尿生殖道炎症（滴虫性阴道炎）   |                  疟疾                 |       先天性、获得性弓形虫病       | 机会致病：腹泻 |
|     检查方法     | 碘液染色法（查包囊）<br/>脓血便直接涂片法 | 碘液染色法（查包囊）<br/>水样便直接涂片法<br/>十二指肠引流法 |     泌尿生殖道分泌物直接涂片法     |            外周血涂片染色法           |                  -                 |        -       |
{{< /table >}}

{{< table title="宽度比较小的表格" caption="宽度比较小的表格会被拉伸到最大宽度" attr="引用说明" >}}
|                  |               溶组织内阿米巴              |    隐孢子虫    |
|:----------------:|:-----------------------------------------:|:--------------:|
|     感染阶段     |             成熟包囊/四核包囊             |      卵囊      |
|     感染方式     |                    经口                   |      经口      |
|   ~~体内移行~~   |                     -                     |        -       |
{{< /table >}}

## 全站消息

在根目录创建文件 `static/data/messages.json`，格式如下：

```json
{
    "id 01": {
        "title": "Hello",
        "type": "error",
        "content": "This is the content of site message."
    },
    "02": {
        "title": "Hello",
        "content": "This is the content of site message."
    },
    "03": {
        "content": "This is the content of site message."
    }
}
```

- 消息 ID（`id 01`、`02`）：一个任意唯一的字符串。ID 中的空格会被替换为 `-`。
- `title`（可选）：消息标题，任意字符串。
- `type`（可选）：消息样式，可用的有 `default`（默认）、`info`、`warning`、`danger`/`error`。
- `content`：消息正文内容，任意字符串，支持 HTML。

{{< tab type="default" summary="" details=true >}}
所有消息都将会在最后一个消息被关闭后 14 天再次出现。
{{< /tab >}}

## 搜索

快捷键 <kbd>Ctrl</kbd>+<kbd>/</kbd> 或点击搜索按钮开始搜索，支持模糊搜索和[高级搜索](https://fusejs.io/examples.html#extended-search)。

## 数学公式

LaTeX 公式编辑器：[Equation Editor for online mathematics](https://editor.codecogs.com/)
