---
title: 人人都能拥有的广告位
date: 2019-08-13 21:07:00
tags:
    - 广告
    - Google
    - 钱
    - 博客
categories: 博客搭建
---

<p align="center">
    <img  src='https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190813211435.jpg' class="full-class">
</p>


## 前言
此篇是本博客引入 Google 广告的过程  
算是教程吧

<!--more-->

## 准备
- 一个稳定的 VPN  
不稳定也行，注册卡顿你不介意就行……
- 一个博客  
要原创几篇文章，我猜是人工审核吧
- 一个 Google 账号

## 申请开通
1. [传送门](https://www.google.cn/adsense/start/#/?modal_active=none)
2. 将谷歌提供的代码扔在 head 里，因为我的博客是 `hexo v6.0`，所以将验证代码扔在了 `themes/next/layout/_custom/head.swig` 里面，这样之后主题升级会更加平滑
3. 验证完后，等两三天，审核通过就可以了

友情提醒：新站不容易过审

## 配置
### 自动广告
没玩过，据说是 Google 爸爸根据网站长宽比投放的，投放率很低。

### 广告单元
这是今天要讲的关键部分

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190813201757.png)
#### 展示广告  
将代码插入到 `themes/next/layout/_macro/sidebar.swig` 文件中 `<div class=”sidebar-inner”> </div>` 标签包裹着的最下部。

#### 信息流广告
类似知乎推荐、QQ 空间信息流式中的广告，扔太多地方不好就没研究了。

#### 文章内嵌广告  
可以放在文章尾部，代码往 `themes/next/layout/_macro/post.swig` 一扔就行
 
PS：不过得注意位置我扔在这里，大佬们可根据自己博客在浏览器 F12 选位置嵌代码。    
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190813205025.png)
 
后来发现内嵌广告太大，就改成了展示广告的横幅版了……
 
 
## 最后
一般 Chrome 或者 FireFox 都会装广告屏蔽插件，手机浏览器应该不会被屏蔽，所以一般也不会有人点。（那为啥要装？~~人总要有梦想，万一有人问了呢~~）

游客点一下根据广告质量来算钱，有点一下 0.14 刀的也有 0.07 刀的，广告点满一百刀才能体现。不过别想着薅羊毛，鬼知道 Google 怎么检测的，容易被封号，还是希望大佬们不要舍本逐末吧。
 
最后，大佬们，关掉广告插件帮我点个广告可好～