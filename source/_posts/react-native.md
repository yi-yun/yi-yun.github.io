---
title: React Native 爬坑笔记
date: 2019-01-17 14:17:45
tags:
    - 总结
    - 学习
    - ReactNative
    - Android
    - Node
categories: 日常记录
---

<p align="center">
    <img  src='https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190117142231.png' class="full-class">
</p>
## 提要

早就听说了 FaceBook 出的 [React Native](https://reactnative.cn) 混合开发，一套代码两个平台的应用。前几天终于有幸尝试了几个应用，折腾死我了...

<!--read-->

## 环境搭建
- Android Studio  
因为之前有一定的原生安卓开发经验，所以 Android Studio 的环境我是有的
- Node  
好巧，我也有，因为这个 Hexo 博客（手动滑稽）。这里要提醒新手的是最好改一下镜像链接，国外而很慢...还有记得装 yarn，比 npm 好用
- Python
官网要 2.0，但是我电脑上装的 3.0，而且在 0.57 的教程里我并没有看到 Python 的安装以及路径，因为怕之后的环境冲突，所以没装

PS：这里需要提醒的是...官网的教程默认是最新版，你要按需手动切换版本号

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190117133627.png)

不一样的版本号教程有点不一样，对没错就是 Python2 以及 Android Studio 一些东西不一样，有些版本详细，有些版本简陋（手动微笑）

## Hello World

尝试新东西肯定是从最开始的学起，咔咔咔按照教程的配置完，然后 `react-native run-android`，嗯？忘了打开 Android Studio，哦对了要等 Gradle 构建完成才行

重新插入手机，使 Android Studio 识别，然后继续 `react-native run-android`，嗯？红屏报错
 `make sure your bundle is packaged correctly or you're running a packager server`，提示找不到 Node 服务器。官网的教程里有解决方案，在真机运行时，需要通过 `adb reverse tcp:8081 tcp:8081` 命令指定端口，端口具体无所谓，别被占用都行...
 
指定完端口，重新运行就没问题了，通过 `RR` 动态修改代码后显示，体验真的不错...
 
## 高级
 
折腾 React Native 的主要目的是跑起来搭档给我的工程
 
### 编译问题
 
Gradle 是 2.14 版本的，可能是从 GitHub 很久之前的仓库下的，下载了 Gradle，折腾了小半天，把报错啥的解决了，Gradle 终于 Build 正常了...
 
接着重新运行还是没找到服务器，很绝望...
 
 
### 尝试解决
- 下载 AVD  
我是个有强迫症的人，容不得 C 盘有乱七八糟的东西，但是没办法，然而还是找不到服务器...
- 夜神模拟器  
可能还是端口的问题
- 解决方案  
`react-native run-android` 这条命令是真的坑，询问同伴之后，换成了 `react-native start`，插上真机，然后手动去 Android Studio 右上角运行，撒花完结...

## 总结

- 遇到问题多谷歌
- 多询问爬过坑的小伙伴
- 不要自己没玩过就推荐给别人，看和自己动手是两回事
