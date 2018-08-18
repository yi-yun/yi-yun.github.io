---
title: Android Studio 安装（减少 C 盘空间）
date: 2018-08-18 10:47:28
tags: 
    - Android Studio 安装配置
    - 笔记
categories: win 配置
---

<p align="center">
  <img src="https://i.loli.net/2018/08/15/5b73a619714be.jpg" alt="IMG_5686.jpg" title="IMG_5686.jpg"  class="full-image" width=650/>
</p>


### 前言

之前重新安装了双系统，装完怎么能没有 Android Studio 这个神器呢？
但博主是个强迫症的人，一般软件不喜欢安装在 C 盘，最主要的原因是 C 盘空间初始分的太小，加上 Windows 的尿性，天天更新之类少空间就很头疼
<!--more-->

### 配置 Java 环境

这里我装的是 Java 8 的环境，配置环境对于老手来说手到擒来。~~我不会告诉你们我配的时候去网上看了遍教程......~~

### 下载 Android Studio

很多人推荐去[官网](https://developer.android.com/studio/)下，这是最新的（可能有老版的，但我没找到），但 3.1 以上的版本我记得没有 Android Monitor，而且可能访问速度不够快，最好有个梯子，个人不是很推荐

我是去[这里](http://www.androiddevtools.cn/)下的，点开页面惊不惊喜？竟然是中文的！你也可以直接在此页面点[链接](https://dl.google.com/dl/android/studio/install/3.0.1.0/android-studio-ide-171.4443003-windows.exe?utm_source=androiddevtools&utm_medium=website)下载 Android Studio 3.0.1.exe 安装程序

### 安装 Android Studio

更改安装路径，一路 next 即可

#### 配置 Android Studio（重要）

#### 选择 Custom

选择 Standard 模式可能更改不了路径

#### 取消勾选 Android Virtual Device 

顾名思义安卓虚拟机，调试用的个人不喜欢安装这玩意，原因有很多：
- 占用空间只能装在 C 盘的
- 我有淘汰的 Android 手机
- 没有域名映射，调试的时候有点问题
- 实在不行，可以用夜神模拟器代替

总之，我就算是死也不会装的！~~真香~~

#### 移动文件

主要移动的是用户目录下的以下文件![文件目录](https://i.loli.net/2018/08/18/5b77837e050c8.png)

##### 更改 gradle 目录

打开 AS 的 setting，进行相关设置

![](https://i.loli.net/2018/08/18/5b7784e690ba4.png)

##### 更改 Android Studio 配置相关目录

进入 Android Studio 安装位置，比如我安装在了`D:\Android Studio`，找到`D:\Android Studio\bin\idea.properties`
更改配置文件，将两个路径更改为自己喜欢的路径，如图

![](https://i.loli.net/2018/08/18/5b77866f6a904.png)

更改完保存重启即可
