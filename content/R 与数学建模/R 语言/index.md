---
title: R 语言
comments: true
mathjax: false
date: 2021-08-19T18:26:37+08:00
lastmod: 2023-12-25T17:43:29+08:00
tags:
    - R
    - 数学建模
    - 数据分析
---

R 语言基础，主要参考：
- 李东风 [《R 语言教程》](https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook)
- 菜鸟教程 - [R 语言教程](https://www.runoob.com/r/r-tutorial.html)

数据科学相关见 [R 数据科学]({{< relref "/R 与数学建模/R 数据科学" >}})。

<!--more-->

## 快速开始

### 输出

```r
cat("sin(pi/2)=", sin(pi/2), "\n") # cat()
sink("tmpres01.txt", split=TRUE)
print(sin(pi/6))
print(cos(pi/6))
cat("t(10)的双侧0.05分位数（临界值）=", qt(1 - 0.05/2, 10), "\n")
sink() # sink()
```

### 输出到文件

```r
sink(file = 'log001.txt', append = TRUE)
cat("log10(2)=", log10(2))
cat(" log10(5)=", log10(5))
cat('\n')
sink()
```

### 从 CSV 文件中读取

```r
tab = read.csv2("taxsamp.csv", header = TRUE, as.is = TRUE,
                fileEncoding = "UTF-8")
print(head(tab))
tab = readr::read_csv("taxsamp.csv", show_col_types = FALSE)
print(head(tab))
```

### 正态分布

```r
dnorm(10) + pnorm(10)
qnorm(pnorm(0.9))
norm = function(x) {
  x = abs(x)
  return(rs = 1 - 2*pnorm(-x))
}
norm(1)
## norm = Vectorize(norm); norm(c(1, 2, 3))
norm(c(1, 2, 3))
```
分布函数名字的前缀有四种：
1. `d` - 概率密度函数
2. `p` - 概率密度积分函数（从无限小到 x 的积分）
3. `q` - 分位数函数
4. `r` - 随机数函数（常用于概率仿真）

## R 基本运算


## R 数据类型

R 基本数据类型有三种：数字、逻辑和文本型。

### 数值型向量及其运算

#### 向量化函数

R中的函数一般都是向量化的: 在 R 中， 如果普通的一元函数以向量为自变量，一般会对每个元素计算。 这样的函数包括 `sqrt`, `log10`, `log`, `exp`, `sin`, `cos`, `tan` 等许多。 如

```r
sqrt(c(1, 4, 6.25))
```

为了查看这些基础的数学函数的列表，运行命令 `help.start()`，点击链接"Search Engine and Keywords"， 找到"Mathematics"栏目，浏览其中的"arith"和"math"链接中的说明。 常用的数学函数有：

- 舍入 `ceiling`, `floor`, `round`, `signif`, `trunc`, `zapsmall`
- 符号函数 `sign`
- 绝对值 `abs`
- 平方根 `sqrt`
- 对数与指数函数 `log`, `exp`, `log10`, `log2`
- 三角函数 `sin`, `cos`, `tan`
- 反三角函数 `asin`, `acos`, `atan`, `atan2`
- 双曲函数 `sinh`, `cosh`, `tanh`
- 反双曲函数 `asinh`, `acosh`, `atanh`

有一些不太常用的数学函数：

- 贝塔函数 `beta`, `lbeta`
- 伽玛函数 `gamma`, `lgamma`, `digamma`, `trigamma`, `tetragamma`, `pentagamma`
- 组合数 `choose`, `lchoose`
- 富利叶变换和卷积 `fft`, `mvfft`, `convolve`
- 正交多项式 `poly`
- 求根 `polyroot`, `uniroot`
- 最优化 `optimize`, `optim`
- Bessel 函数 `besselI`, `besselK`, `besselJ`, `besselY`
- 样条插值 `spline`, `splinefun`
- 简单的微分 `deriv`

如果自己编写的函数没有考虑向量化问题， 可以用 `Vectorize()` 函数将其转换成向量化版本。

#### 列表操作

```r
x <- c(77,60,91,73,85,82,35,100,66,75)
sort(x)
rev(sort(x))
rev(sort(x, decreasing = TRUE))
sum(x)
mean(x)
var(x)
sd(x) ^ 2
range(x) == c(min(x), max(x))
prod(x) # 所有元素的乘积
```

```r
typeof(seq(1, 5, by=2)) == typeof(seq(1,5))
seq(0, 2*pi, length.out=100) # 从0到的等间隔序列， 序列长度指定为100
seq(2,5) == seq(to=5, from=2)
rep(0101, 100)
```

#### 无限

```r
is.infinite(10)
is.finite(Inf)
c(1,20) %in% c(1,2,10)
```

#### 复数

```r
complex(real = c(1,0,-1,0), imaginary = c(0,1,0,-1)) # 指定实部和虚部
complex(mod=1, arg=(0:3)/2*pi) # 指定模和辐角
sqrt(-1) # NaN
sqrt(-1+0i)
```

### 逻辑型向量及其操作

#### 比较

```r
c(1, 3, 5, 9) > c(1, 3)
(1:4) >= (4:1) # brackets are used to specific priority
```

Comparing with `NaN` or `NA` engenders `NaN`.

```r
c(1, NA, NaN) > 3
```

Using `is.na()`, you can judge whether a value is `NA`.

```r
is.na(c(1, NA, NaN) > 3)
```

#### 属于运算符

```r
c(1,3) %in% c(2,3,4)
```

```r
all(c(1, NA, 3) > 2)
any(c(1, NA, 3) > 2)
which(c(FALSE, TRUE, TRUE, FALSE, NA))
which((11:15) > 12)
```

#### 逻辑运算符

```r
side <- function() {
  print("side effect")
  return(FALSE)
}

if(TRUE || side()) {
  print("hello")
}
```

#### 逻辑运算函数

```r
all(c(1, NA, 3) > 2)
any(c(1, NA, 3) > 2)
```

```r
which(c(FALSE, TRUE, TRUE, FALSE, NA))
```

```r
identical(c(1,2,3), c(1,2,3))
identical(c(1L,2L,3L), c(1,2,3))
all.equal(c(1L,2L,3L), c(1,2,3))
identical(c(1,2,3), c(1,2,NA))
```

```r
duplicated(c(1,2,1,3,NA,4,NA))
unique(c(1,2,1,3,NA,4,NA))
```

### 字符型数据及其处理

#### `paste` 合并字符串

`paste` is used to connect two (groups of) strings.

```r
paste(c("ab", "cd"), c("ef", "gh"))
paste("x", 1:3, sep = "_")
```

With `collapse`, you join results into one string.

```r
paste("x", 1:3, sep = "_", collapse = " + ")
paste(c("x_1", "x_2", "x_3"), collapse = " + ")
```

#### `format` 格式化字符串

语法格式如下：

```r
format(x, trim = FALSE, digits = NULL, nsmall = 0L,
       justify = c("left", "right", "centre", "none"),
       width = NULL, na.encode = TRUE, scientific = NA,
       big.mark   = "",   big.interval = 3L,
       small.mark = "", small.interval = 5L,
       decimal.mark = getOption("OutDec"),
       zero.print = NULL, drop0trailing = FALSE, ...)
```


```r
## 显示 9 位，最后一位四舍五入
result <- format(23.123456789, digits = 9)
print(result)

## 使用科学计数法显示
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)

## 小数点右边最小显示 5 位，没有的以 0 补充
result <- format(23.47, nsmall = 5)
print(result)

## 将数字转为字符串
result <- format(6)
print(result)

## 宽度为 6 位，不够的在开头添加空格
result <- format(13.7, width = 6)
print(result)

## 左对齐字符串
result <- format("Runoob", width = 9, justify = "l")
print(result)

## 居中显示
result <- format("Runoob", width = 10, justify = "c")
print(result)
```

```
#> [1] "23.1234568"
#> [1] "6.000e+00" "1.315e+01"
#> [1] "23.47000"
#> [1] "6"
#> [1] "  13.7"
#> [1] "Runoob   "
#> [1] "  Runoob  "
```

#### 转换

##### 大小写

```r
toupper('aB cd')
tolower('aB cd')
```

##### 数字与字符

```r
as.numeric(substr('JAN07', 4, 5)) + 2000
as.numeric(substr(c('JAN07', 'MAR66'), 4, 5))
as.character((1:5)*5)
```

#### 索引、切片和分割

```r
nchar("Lua 迭代器和泛型 for", type="bytes")
nchar("Lua 迭代器和泛型 for", type="chars")
plot.new(); strwidth("Lua 迭代器和泛型 for")
```

```r
substr("12345", 2, 4)
substr(c('JAN07', 'MAR66'), 1, 3)
substring(c('JAN07', 'MAR66'), 4)
substring(c('JAN07', 'MAR66'), 1, 3)
```

```r
x <- '10,8,7'
strsplit(x, ',', fixed=TRUE)[[1]]
```

#### 替换

```r
x <- '1, 3; 5'
gsub(';', ',', x, fixed=TRUE)
strsplit(gsub(';', ',', x, fixed=TRUE), ',')[[1]]
```

#### 正则表达式

- `grep()` 和 `grepl()` 函数从字符串中查询某个模式， `sub()` 和 `gsub()` 替换某模式
- `stringr` provides more powerful functions. For details, see [Regular expressions](https://cran.r-project.org/web/packages/stringr/vignettes/regular-expressions.html).

Some useful packages:

- https://github.com/gadenbuie/regexplain
- https://github.com/daranzolin/inferregex
- https://github.com/VerbalExpressions/RVerbalExpressions

## R 对象类型

R 数据按对象类型分有六种：**向量**（vector）、**矩阵**（matrix）、**数组**（array）、**因子**（factor）、**数据框**（data.frame）、**列表**（list）。

## 下标和子集

### 正整数下标

```r
x <- c(1, 4, 0.6, 5, 100)
cat("x[1]\t", x[1], "\nx[31]\t", x[31], sep = '')
```

{{% tab info %}}
非整数正数下标会自动被舍去小数部分。

```r
x <- c(1, 4, 0.6, 5, 100)
x[1.9]
```
{{% /tab %}}

### 负整数下标

负整数下标表示去除对应元素。

```r
x <- c(1, 4, 0.6, 5, 100)
x[-2]
```

### 空下标和零下标


```r
x <- c(1, 4, 0.6, 5, 100)
x[]
x[] <- 999
x
x <- 999
x
```

### 下标超界

- 取值时，超界下标对应的值为缺失值 `NA`
- 赋值时，向量自动变长，中间没有赋值的值为缺失值 `NA`

```r
x <- c(1, 4, 6.25)
x[10]
x[10] <- 10
x
```

### 逻辑下标

逻辑下标可以用来取所有符合要求的元素所构成的子集。不过要注意处理缺失值问题。

```r
x <- c(10, 2, 4, 6.25, NA)
x[x > 3]
x[x > 3 & !is.na(x)]
```

### `which` 函数

函数 `which()` 可以用来找到满足要求的值对应的下标，如

```r
x <- c(3, 4, 3, 8, 7, 5, 9)
x %% 2 == 0
which(x %% 2 == 0)
x[which(x %% 2 == 0)]
```

也可以使用 `seq(along=x)` 代替：

```r
x <- c(3, 4, 3, 8, 7, 5, 9)
seq(along=x)
seq(along=x)[x %% 2 == 0]
```
用 `which.min()`、`which.max()` 求最小值的下标和最大值的下标，不唯一时只取第一个。如


```r
x <- c(3, 4, 3, 9, 7, 5, 9)
which.min(x)
which.max(x)
```

### 元素名

向量可以为每个元素命名，如

```r
ages <- c("李明"=30, "张聪"=25, "刘颖"=28)
```

或

```r
ages <- c(30, 25, 28)
names(ages) <- c("李明", "张聪", "刘颖")
```

或

```r
ages <- setNames(c(30, 25, 28), c("李明", "张聪", "刘颖"))
```

然后就可以用元素名作为下标，如

```r
ages <- c("李明"=30, "张聪"=25, "刘颖"=28)
ages["张聪"]
ages
```

```r
ages <- c("李明"=30, "张聪"=25, "刘颖"=28)
unname(ages)
ages
names(ages) <- NULL
names(ages)
```

`unname(ages)` 返回去掉元素名的副本，不修改 `ages`，`names(ages) <- NULL` 则会去掉 `ages` 的元素名。

除了给向量元素命名外， 在矩阵和数据框中还可以给行、列命名， 这会使得程序的扩展更为容易和安全。

### 用 R 向量下标作映射

R 向量可以用字符型向量作下标，字符型下标也允许重复，所以可以把带有元素名的 R 向量看成是元素名到元素值的映射表。比如，设 `sex` 为 10 个学生的性别（男、女）。用 R 向量 `sex.color` 当作映射，可以获得每个学生对应的颜色：

```r
sex <- c("男", "男", "女", "女", "男", "女", "女", "女", "女", "男")
sex.color <- c("男"="blue", "女"="red")
cols <- sex.color[sex]; print(cols)
unname(cols)    # 使用 unname() 去掉元素名
```

### 集合运算

用 `%in%` 运算符可以判断某值是否在向量中：

```r
c(5,6) %in% c(1,5,2)
```

用 `match()` 可以获取值在向量中首次出现的位置（下标），没有则返回 `NA_integer_`（整数型缺失值）：

```r
match(c(2,5,0), c(1,5,2,5))
```

用 `intersect(x,y)`、`union(x,y)`、`setdiff(x,y)` 分别求交集、并集、补集：

```r
intersect(c(5, 7), c(1, 5, 2, 5))
union(c(5, 7), c(1, 5, 2, 5))
setdiff(c(5, 7), c(1, 5, 2, 5))
```

用 `setequal()` 可判断两个集合是否相等，不受次序与重复元素的影响，如

```r
setequal(c(1,5,2), c(2,5,1,5))
```

```lua
print("hell")
```

## R 控制语句

### 判断语句

#### `if` 和 `else`

`if` 语句：

```r
x <- 50L
if(is.integer(x)) {
   print("X 是一个整数")
}
```

`if-else` 语句：

```r
x <- c("google","runoob","taobao")

if("runoob" %in% x) {
   print("包含 runoob")
} else {
   print("不包含 runoob")
}
```

`if-else if-else` 语句：

```r
x <- c("google","runoob","taobao")

if("weibo" %in% x) {
   print("第一个 if 包含 weibo")
} else if ("runoob" %in% x) {
   print("第二个 if 包含 runoob")
} else {
   print("没有找到")
}
```

#### `switch`

`switch` 语句格式如下：

```r
switch(expression, case1, case2, case3....)
```

- `switch` 语句中的 `expression` 是一个常量表达式，可以是整数或字符串，如果是整数则返回对应的 `case` 位置值，如果整数不在位置的范围内则返回 `NULL`。
- 如果匹配到多个值则返回第一个。
- `expression` 如果是字符串，则对应的是 `case` 中的变量名对应的值，没有匹配则没有返回值。
- `switch` 没有默认参数可用。


```r
x <- switch(3,
    "google",
    "runoob",
    "taobao",
    "weibo"
)
print(x)
you.like <- "runoob"
switch(you.like,
    google = "www.google.com",
    runoob = "www.runoob.com",
    taobao = "www.taobao.com"
)
```

```
#> [1] "taobao"
#> [1] "www.runoob.com"
```

#### 循环

##### 循环控制语句

R 提供 `break` 和 `next` 两个循环控制语句：
- `break`：终止循环，跳转到循环外
- `next`：终止本次循环，开始下一次循环，与其他语言中的 `continue` 一样

##### 循环类型

###### `while` 循环

语法格式如下：

```r
while(condition)
{
   statement(s);
}
```

```r
v <- c("Google","Runoob")
cnt <- 2

while (cnt < 7) {
   print(v)
   cnt = cnt + 1
}
```
###### `repeat` 循环

语法格式：

```r
repeat {
    # 相关代码
    if(condition) {
       break
    }
}
```

`repeat` 无法自己退出，需要依靠 `break` 语句退出：


```r
v <- c("Google", "Runoob")
cnt <- 2

repeat {
    print(v)
    cnt <- cnt + 1
    if (cnt > 5) {
        break
    }
}
```

```
#> [1] "Google" "Runoob"
#> [1] "Google" "Runoob"
#> [1] "Google" "Runoob"
#> [1] "Google" "Runoob"
```

`repeat` 其实相当于 `while(TRUE)`。以上代码可以写做


```r
v <- c("Google", "Runoob")
cnt <- 2

while (TRUE) {
    print(v)
    cnt <- cnt + 1
    if (cnt > 5) {
        break
    }
}
```

```
#> [1] "Google" "Runoob"
#> [1] "Google" "Runoob"
#> [1] "Google" "Runoob"
#> [1] "Google" "Runoob"
```

###### `for` 循环

语法格式如下：

```r
for (value in vector) {
    statements
}
```


```r
v <- LETTERS[1:4]
for (i in v) {
    print(i)
}
```

```
#> [1] "A"
#> [1] "B"
#> [1] "C"
#> [1] "D"
```

## R 函数

### 定义函数

R 语言中的函数定义使用 `function` 关键字，一般形式如下：

```r
function_name <- function(arg_1, arg_2, ...) {
    # 函数体
    return(0)
}
```

### 使用参数

函数参数，可以按函数创建时的参数顺序来传递，也可以按参数名传递：


```r
## 创建函数
f <- function(a, b, c) {
    result <- a * b + c
    print(result)
}

## 按顺序传递
f(5, 3, 11)

## 按参数名传递
f(a = 11, b = 5, c = 3)
```

```
#> [1] 26
#> [1] 58
```

### 懒惰计算的函数

只有用到某一个参数时，函数才会去查找这个参数，此时如果发现没有传递该参数，函数会报错，否则忽视：


```r
f <- function(a, b) {
    print(a^2)
    print(a)
    print(b) # 使用到 b，但未传入，所以会报错
}

## 传入一个参数 a
f(6)
```

```
#> Error in f(6): 缺少参数"b",也没有缺省值
```

```
#> [1] 36
#> [1] 6
```

## R 数据结构

### Data Frame


```r
paths_len <- data.frame(
    row.names = c("A", "B", "C", "D"),
    "1" = c(0, 1, 1, 1),
    "2" = c(1, 0, 1, 2),
    "3" = c(1, 1, 0, 1),
    "4" = c(1, 2, 1, 0)
)
print(paths_len)
print(as.matrix(paths_len))
```

```
#>   X1 X2 X3 X4
#> A  0  1  1  1
#> B  1  0  1  2
#> C  1  1  0  1
#> D  1  2  1  0
#>   X1 X2 X3 X4
#> A  0  1  1  1
#> B  1  0  1  2
#> C  1  1  0  1
#> D  1  2  1  0
```
