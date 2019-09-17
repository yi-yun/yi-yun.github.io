---
title: Linux 下 IDEA 的 Ctrl+Alt+S
date: 2019-09-17 17:46:59
tags:
    - Linux
    - 排错
    - 踩坑
    - IDEA
categories: 日常记录
---

<p align="center">
    <img  src='https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190917175139.jpg' class="full-class">
</p>

## 前言
这是个困扰我一年多的问题，今天终于解决了……
<!--more-->

## 起因
一年前将主系统换成 Arch Linux 后，其他一切正常就是 IDEA 的打开设置的快捷键 ctrl+alt+s 失效，让我很是头疼。虽然不是很重要，但是对于我这种强迫症来说别提多难受了……

我曾多次在设置里的快捷键查找 Ctrl+Alt+S，每次无功而返。

## 解决
今天在群里闲聊到 Linux 下 IDEA 的快捷键问题，一位大佬就发了一张解决方案的截图给了我新的思路。

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190917172104.jpg)

Linux 万物皆是文件

倾向于系统文件快捷键的占用，所以我下载了 dconf-editor 去更改快捷键的文件。不幸的是看上去并没有什么问题，文件显示层叠窗口的快捷键并没有被设置。打开搜狗输入法以及 Konsole 也都没有发现 Ctrl+Alt+S 的痕迹，那为什么会被占用呢？百思不得其解……


想起了之前加入 TG 上的 Arch Linux 官方群组，就去上面将问题描述了一遍。一分钟后，大佬告诉我是因为 fcitx 的全局快捷键，Ctrl+Alt+S 被设置成保存所有设置和历史。

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190917173543.png)

收到回复后，我一想那简单啊，修改配置文件不就完了……
天真的把 S 改成 Q，重新登录发现并没有什么卵用。定睛一看前面还有 # 号（吐血.jpg）……改成下面这样重启登录就解决了。

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190917174122.png)

## 总结
1. gnome 可以下载 dconf-editor 去查找快捷键有没有被默认系统设置占用，kde 只需在设置里查找是否有重复的快捷键即可
2. 看看是不是因为输入法的框架是 fctix，是的话修改 fctix 的配置文件，将保存所有设置的快捷键改成其他键位
3. 直接改 IDEA 的快键键不好么？？？

这个快捷键终于解决了，让我心情很舒畅！！！希望今后能帮助到其他人。