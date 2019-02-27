---
title: 一个热点玩转树莓派
date: 2019-02-27 15:34:40
tags:
    - 笔记
    - 树莓派
    - 设置
categories: 树莓派
---
<p align="center">
    <img  src='https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190227154346.png' class="full-class">
</p>
<!--[TOC]-->

## 前言
前几天[千魂剑](https://blog.asucreyau.xyz)问我关于树莓派的问题，好久不用了，感觉有点遗忘，就有了此篇文章。

<!--more-->
## 安装系统
- [官方下载地址](https://www.raspberrypi.org/downloads/raspbian/)  
对是压缩包，所以 Windows 下的 [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/files/latest/download) 可以直接刻录 zip 到 TF 卡

### 工具推荐
- 读卡器  
虽然 SD 卡也可以，但现在很多电脑没有 SD 卡槽
- 镜像烧录
    - Win
        - [Rufus](http://rufus.ie/)
    - Mac  
    买不起，没用过
    - Linux
        - dd 命令


## ssh

> 两种方法，网线，热点，但两者需要在一个局域网内  。
> 拥有屏幕的用户请路过...


### 网线
连一根网线到路由器，在路由器后台查看 IP 撒花完结。

### 热点
> 其实，树莓派基金会为了达成这个需求， 2017-2018 年逐渐在改善系统来适应这种优雅的方式，所以此方法只适用于新版系统。

1. 打开烧录好的内存卡文件夹
1. 找到 `/boot` 分区
1. 建立一个空的 `ssh` 文件以及 `wpa_supplicant.conf`
    ```properties
    country=GB
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    network={
        ssid="你的Wifi名称，注意大小写"
        psk="你的Wifi密码"
    }
    ```
说明：空的 ssh 文件是为了开启 ssh 服务，系统默认不开启；wpa_supplicant.conf 是为了自动连接热点，ssid 支持中文。开机会将会删除以上两个文件。

## raspi-config
> 默认管理员用户为 pi，密码为 raspberry

- 设置时间
- 将 tf 卡填充满  
默认系统只占很少的空间


## 镜像源更改
> 树莓派源分为两种，一种为树莓派基金会提供，另一种由独立开发者提供

- 查询版本号  
`lsb_release -a` 不一样的版本更改源的地址不一样，版本号有 Stretch、Jessie 等，一般最新的是 `Stretch`
- 官方源修改  
这个软件源相关资料比较少，修改树莓派基金会单独提供的源
    ```properties /etc/apt/sources.list.d/raspi.list
    deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ stretch main ui
    ```
- 开发源修改
    ```properties /etc/apt/sources.list
    deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi
    deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ stretch main contrib non-free rpi
    ```

最后别忘了 `sudo apt-get update` 更新系统

## 个人体验
> 我是拿树莓派当本地服务器的

- 喜欢纯命令行，不喜欢 VNC，而且感觉有点卡顿
- 风扇有点响，据说要买那种悬浮的，然而我是一套
- 散热片、亚克力壳，就是好看
- 不下片的话，8G TF 卡够了

## 参考链接
- [树莓派—raspbian软件源（全）](https://www.jianshu.com/p/67b9e6ebf8a0)
- [树莓派如何完全无头(无屏无网线无键盘鼠标)安装](https://www.jianshu.com/p/f260967aefb1)