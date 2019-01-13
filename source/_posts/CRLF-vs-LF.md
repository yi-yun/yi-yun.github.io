---
title: 强迫症对 CRLF 和 LF 的执念
date: 2019-01-13 11:30:38
tags: 
    - 个人
    - Git
    - 笔记
categories: 代码协作
---

<p align="center">
    <img  src='https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190112203817.png' class="full-class">
</p>

## 介绍

> CRLF 以及 LF 是用来表示文本换行的方式。CR(Carriage Return)代表回车，对应字符`\r`；LF(Line Feed)代表换行，对应字符`\n`
由于历史原因，不同的操作系统文本使用的换行符各不相同。主流的操作系统一般使用 CRLF 或者 LF 作为其文本的换行符。其中，Windows 系统使用的是 CRLF，Unix 系统(包括 Linux，MacOS 近些年的版本)使用的是 LF。

<!--more-->

## 问题的由来
各个系统间的这个换行差异让我这个强迫症饱受摧残。虽然至今并发生没有什么大问题，但是当你 Git 提交的文件更改是重新删除文件，再插入的时候，让强迫症的我很难受，更重要的是无法直接查看修改。

## 原因

发现问题的没有头绪第一时间当然谷歌了。这一谷歌不得了，发现这个回车是挺坑的。

Git 的 Windows 客户端在安装时会有如下图这样的提示
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190112195503.png)
这是 Git 的自动转换，当你在签出文件时，Git 试图将 UNIX 换行符(LF)替换为 Windows 的换行符(CRLF)；当你在提交文件时，它又试图将 CRLF 替换为 LF，所以才会改变整行。

**不过可喜的是，据说新版本的 Git 已经修复了这个功能（并没有亲测）**，而且我并没有找到相关的证据。另外，也有很多人用的老版本的。

## 解决方案

### 设置 Git(重要)
不管怎样，先设置在 Git 终端里敲下这两条命令
```bash
git config --global core.autocrlf false
git config --global core.safecrlf true
```

一般敲完这两条就可以洗洗睡了~

下面是身为强迫症晚期的习惯

### 编辑器统一
将我 Windows 下的编辑器以及 IDE 统一为 Unix(/n)以及 UTF-8 的风格~~(什么？Arch 里也要变？你火星来的吧)~~

### .editorconfig

神器，保存时会自动格式化内容

#### 使用
去他的[官网](https://editorconfig.org/)看编辑器以及 IDE 是否原生支持 .editorconfig，不自带需要安装插件，然后在工程目录下
直接扔下这个文件完事
```properties
root = true

[*]
charset = utf-8
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
indent_style = space
indent_size = 2

[*.py]
indent_size = 4
```

#### 特别说明

原先是 CRLF 的文件第一次更改还是会全部删除后插入，但是之后提交就不会了

## 参考
[GitHub Issue](https://github.com/cssmagic/blog/issues/22)
