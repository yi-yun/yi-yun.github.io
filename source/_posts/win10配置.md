---
title: win10 软件推荐（附下载链接）
date: 2018-10-09 22:24:08
tags: 
    - 奇淫怪技
    - Windows
    - 配置笔记
    - 软件
categories: win 配置
---

<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/background-720224__340.jpg" class="full-image"/>
</p>

## 前言

重装系统过的朋友肯定很头疼要安装哪些软件？很多都是之前网上找的，并没有保存安装包，导致后续有很多麻烦。

本篇文章主要为了解决这个问题，当然里面的软件也只是符合博主的个人口味，按需获取。

**系统兼容性说明：博主大概率以后重装 win10 1803 专业版起步，有些软件兼容性不是很好，请自行在属性兼容性进行测试！**

<!--more-->

## 驱动安装

很多人仍使用的是 PE 包中的万能驱动，所谓万能并不是真正的“万能”，某些驱动在某品牌某型号电脑里不生效，偶尔还会蓝屏！当然那是属于驱动特别倒霉类型的！一般图省事，打万能驱动就完事了。

我还是比较推荐以下两款第三方驱动

* 驱动精灵 
虽然官网上下的软件有点流氓，具有开机占用 CPU、默默更新等一系列症状，但某大佬封装的去广告绿色版还是不错的

* [驱动人生](http://www.160.com/)  
老版本还行，新版本没用过，经常是我其他驱动打崩后的首选，表现还不错！

### FAQ

* 问：win10 新版本不是会自动更新驱动么？为什么还要装驱动？
  答：没错，但博主曾经重装 1803 后，没有打驱动让其自动更新，导致触摸板驱动对于键盘上的按键没反应。重新安装也没有效果，结果一直到现在也没有解决。so,还是看脸···


## office 与 win 激活

理论上这个步骤应该在驱动安装完重启之后，因为驱动容易崩。

### office

个人比较喜欢 Office 2016 Professional Plus（名字看上去就跟别人不一样）。

既然装了就选高端点的版本,其实是版本少见，导致激活工具也难找。

### 激活
很多激活工具说白了都是服务器，自己也可以搭，但有 180 天限制。
但博主并不担心，因为我这台老电脑 win7 升 win10 已经绑定 oem 了，重装也不需要激活系统，只要激活 office 就行了.

- 神龙 kms
运行前下载最新版并关掉杀软，会报毒，能激活 win 和 office，有广告，传言就三行代码，但无伤大雅且易一发入魂。不过好像也有激活时间限制，看脸。

- [数字权利激活](https://github.com/TGSAN/CMWTAT_Digital_Edition)  
链接是 GitHub 地址，对没错是开源的！不知道会不会被微软关掉。
只能激活 win10 系统，前阵子才出的没用过，一直想抽空找虚拟机试试···


## 软件

彩蛋：先安装[这个](#佛曰不可说)

### 浏览器

- [Chrome](https://www.google.com/chrome/)
毫无争议，程序员必备，偶尔因为缓存问题用一下系统自带的 Edge 浏览器


### UWP

不得不说，UWP 是微软的败笔。虽然本意是想模仿苹果的 AppStore,但最后还是缺乏管理，导致垃圾应用泛滥。不过，话说回来，有几个还是不错的。

- 网易云音乐
去除了安装版的笨重、Bug少，虽然不能后台播放，但个人认为这是 UWP 最好的应用，没有之一

- 有道词典
比安装版的好太多，直接复制翻译，还支持文章翻译

- 中国大学慕课
不喜欢看网页的人可以试试这个，还不错

- 邮件
貌似是系统自带的应用，可以收发信，但我偏爱 iOS 上的 QQ 邮箱，没有用电脑处理邮件的习惯。

### 杀毒
微软自家的 Windows Defender 已无力吐槽，还是因为是上文提到的 [UWP](#UWP) 应用，不稳定极了！装一些破解的时候，明明显示关掉的还是会报毒，加白名单的也报毒···

由于它前身之前用的 Win7 的 MSE 软件，一开始本人对它好感爆棚，逢人推荐。现在因为 UWP 应用的经常抽风，已经换成[火绒](https://www.huorong.cn/)了

### 播放器
- PotPlayer
解码编码什么的很烦，PotPlayer 一个搞定全部
设置在这，reg 直接导入即可

- 迅雷看看
这是绿色安装版，方便迅雷边下边看（虽然破解版的迅雷边看边下的播放器可以自己设置）

### 压缩管理
- 推荐 [7zip](https://www.7-zip.org/7z.html)，开源免费

- 我用的 WinRAR，要破解原因是习惯了，下次想尝试使用 7zip

### 美化工具
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/草图.png)

大概是这样子，可能打码有点影响美观...

#### 软煤雷达
有点流氓的软件，但是仔细使用并不影响，而且有绿色版

#### Fence
桌面图标管理软件，配合 [Rolan](#Rolan) 使用效果极佳

#### [Rolan](https://getrolan.com/)
桌面图标管理神器，订阅制。但免费足够了，我发现这个后，再也离不开它，配合 Fence 效果极佳

#### StartIsBack
任务栏透明，~~我用的Startisback 破解版。但据说此软件不适用于最新的win10创意者更新版，会引起很多问题（有一次大版本更新就是因为这个报错了，卸了就好了）推荐下一款~~
替代品：[TranslucentTB](https://github.com/TranslucentTB/TranslucentTB/releases)

### 实用工具

#### [Everything](https://www.voidtools.com/downloads/)
本地搜索软件，好用到爆炸

#### [SumatraPDF](https://www.sumatrapdfreader.org/download.html)
你也可以使用浏览器看，个人喜欢这个轻便简洁的 PDF 阅读器

#### Prezi
演示用的工具，说实话第一次见到它的时候惊艳到我了，相当于 Mac 下的 Keynote，同类的还有万彩的办公大师

[演示](https://prezi.com/)

#### [Picasa](https://picasa.en.softonic.com/?ex=BB-527.1)
没记错的话应该是谷歌的看图软件，Win10 的照片查看器实在太垃圾！

#### [TIM](https://tim.qq.com/download.html)
绿色版 QQ，虽然也开始臃肿了···

#### [WeChat](https://pc.weixin.qq.com/)
这个总不用介绍了吧···
#### [calibre](https://calibre-ebook.com/download)
电子书管理软件，我记得也是全平台吧，貌似还是开源的，很不错,可惜没有在线同步功能，而且我对它需求不大

#### [Typora](https://typora.io/)
MarkDown 写作的神器，全平台可以使用，不用介绍，用过的人都说它好用


#### XMind
很好用的脑图工具，就是不知道放出破解版以后，思杰马克丁会不会给我发律师函...

不想用破解版的朋友可以考虑一下[百度脑图](#)的开源版，全平台的也很不错，就是还有些 Bug

#### OneDrive 
巨硬自家的东西，随着 Win10 的迭代，他也变得好用了起来。
~~什么跟百度网盘比？百度网盘垃圾东西我早就不用了~~（百度网盘真好用+_+认真脸）
PS：OneDrive 学生凭教育邮箱享受 1024GB 的空间哟
#### Internet Download Manager
俗称 IDM，我的主力下载软件，好用到爆炸

- 百度网盘不是下载速度慢么？用油猴抓取真实链接，直接用这玩意下就好了
- 谷歌浏览器和 Edge 都有 IDM 插件支持，所以除了种子都可以下载
- 网页上的视频啊音频啊智能抓取也可以下载

#### 金山电脑清理
某大佬的绿色提取版，个人喜好

#### [Ditto](https://ditto-cp.sourceforge.io/)

以前用的 ClipX，重装后换成了这货，体验还行
使用见[这里](https://sspai.com/post/43700)

#### [VirtualBox](https://www.virtualbox.org/)
比 VMware 那妖艳贱货好用那么一丢丢，主要是免费不用破解，占用资源还小，Linux 下也有

不过现在的我不怎么需要了（傲娇脸）

#### [TeamViewer](https://www.teamviewer.us/downloads/)
QQ 那个远程桌面太鸡肋了，会卡，传输和帧率体验极差

既然要给妹子修电脑，好一点的远程桌面软件是你需要的（滑稽

#### [有道云笔记](https://note.youdao.com/)
记笔记的，签到获取容量

### 艺术处理
曾经一口气装了会声会影、爱剪辑、Vegas、AE、PR、PS、AI 等软件，后来发现只学会了 PR 和 PS

#### Adobe
这里就不介绍了可以在 U盘 上直接运行，直接甩[提取码 8m36](https://pan.baidu.com/s/18Q5ulT59ro70XK_V6mM8Jw)

#### [格式工厂](http://www.pcgeshi.com/)

转化音频的软件，安装需要小心勾选流氓软件


### 编程代码

个人的编程环境搭建

#### [Git](https://git-scm.com/downloads)
不需要解释吧代码管理工具

#### [Node.JS](https://nodejs.org/en/download/)
 - Hexo
 顺便把博客环境搭了

#### Java
[Java](https://www.java.com/download/) 环境肯定要有···

#### [Intellij IDEA](https://www.jetbrains.com/idea/)
学生党就不破解了···教程在[此](https://github.com/judasn/IntelliJ-IDEA-Tutorial
)

#### [Eclipse](http://www.eclipse.org/downloads/packages/release/kepler/sr1/eclipse-ide-java-developers)
不是很想装···

#### Android Studio
安装见[这篇文章](https://yi-yun.github.io/Android-Studio-%E5%AE%89%E8%A3%85/)

#### [Dev-C++](https://sourceforge.net/projects/orwelldevcpp/)
写 C 和 C++ 的 IDE,逢问必推荐这款

什么？VC6.0++？拜托这都 8012 年了，还用远古工具

什么？Visual Studio？算了太大···不适合新手

相信我入门 C语言 选这款，你不会后悔的这玩意好久没用了，要不是今天写文章还想不起来

#### [Python](https://www.python.org/downloads/)
这个肯定要装.jpg，别手贱去装 Anaconda 这玩意

#### [Visual Studio Code](https://code.visualstudio.com/download)
写项目文件好用到爆炸，还有丰富的插件

#### [Notepad++](https://notepad-plus-plus.org/)
不想用自带的文本编辑器，相比楼上那个 Visual Studio Code，这东西启动快

### 开源工具

#### [数字权利激活](https://github.com/TGSAN/CMWTAT_Digital_Edition)
[上文](#激活)提到过

#### [录屏工具](https://github.com/NickeManarin/ScreenToGif)

#### [离线文档浏览](https://github.com/zealdocs/zeal)

#### [PicGo](https://github.com/Molunerfinn/PicGo)
极好用的图床工具，羡慕会 Electron 的大佬

#### [Putty](https://www.putty.org/)
SSH 登录

#### [WinSCP](https://winscp.net/eng/download.php)
Windows 与 Linux 之间互传文件

#### [proxyee-down](https://github.com/proxyee-down-org/proxyee-down)
百度网盘下载

#### [rufus](https://rufus.akeo.ie/)
U 盘刻录工具，装 Linux 系统会用到

#### [佛曰不可说](https://github.com/iMeiji/shadowsocks_install/wiki/shadowsocks-libev-%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85)


## [下载地址](https://caomsacid0-my.sharepoint.com/:f:/g/personal/yi-yun_caoms_ac_id/EqIjMtarICtHmVzGmrezX4wBGx5L1OWlpfsmzmBa31YgqQ?e=7h0s2T)
