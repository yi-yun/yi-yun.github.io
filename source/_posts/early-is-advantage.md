---
title: 早就是优势
date: 2019-02-03 21:39:58
tags:
    - 图床
    - 扯淡
    - 个人
categories: 日常记录
---

<p align="center">
    <img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190203214337.png" class="full-image" />
</p>

## 前言
> 此篇纯属扯淡

如题。

<!--more-->

## 起因
在看本文前，我希望你之前看过[这篇文章](https://yi-yun.github.io/%E5%9B%BE%E5%BA%8A%E7%9A%84%E9%80%89%E6%8B%A9/)并申请了账号，因为白天收到站内信
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190203211950.jpg)

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190203212445.png)

可能被白嫖太多导致这个策略吧2333，时间到期你就需要掏钱了，也就意味着腾讯云对象存储无法再为用户提供免费的服务。你付费当然可以当我没说...~~其实也没多少钱~~ 

主要是个人不喜欢每个月或者每年提供多少钱而且图床一旦选定，更换是件很麻烦的事情

## 总结
> 站在风口上，猪都会飞

此类性质的事件买 VPS 套餐遇到的最多，其中就包括前段时间搬瓦工下架他的传家宝，让我后悔的啊。虽然速度可能不咋地，但是类似大厂家 19.99 刀一年的服务器已经很少了。虽然是小事吧，但是又让我深刻地体会到了“早就是优势”。

就如同时代的风口，没有人能精准预测未来的风口在哪。只能说，我觉得可能某个行业不错，学习以及积攒相关知识，厚积薄发，等待真正机会来临。

另外，推荐一部[短片](https://v.qq.com/x/cover/3mmj3rtxfot0nau/q0830b7hrhw.html?)
{% raw %}
<div id="c" >
  <iframe src="https://v.qq.com/txp/iframe/player.html?vid=q0830b7hrhw" scrolling="no"
          border="0" 
          frameborder="no" 
          framespacing="0" 
          allowfullscreen="true" 
          style="width:100%;height:100%;"> </iframe>
</div>

<script>
  change();
  window.onload = function() {
    window.onresize = change;
  };
  
  function change() {
    var c = document.getElementById("c");
    var p = c.parentNode;  // div容器的父节点，p是parent的首字母

    // 下面是适配容器的宽高
    c.style.width = p.offsetWidth + "px";
    if (navigator.userAgent.indexOf('iPad') === -1 && p.offsetWidth >= 480) {
      // 针对非iPad和div容器父节点宽度值大于OR等于480的情况，480是一个边界值
      // 采用了16:9的比例进行缩放，118px是推荐面板+进度条+哔哩哔哩入口跳转栏等元素高度数值的总和
      c.style.height = c.offsetWidth / 16 * 9 + 118 + 'px';
    } else {
      // 针对iPad或div容器父节点宽度值小于480的情况（手机）
      c.style.height = c.offsetWidth / 16 * 9 + 'px';
    }
  };
</script>

{% endraw %}

嵌入视频链接[参考](https://blog.asucreyau.xyz/2018/11/19/bilibili-embed-optimize/)