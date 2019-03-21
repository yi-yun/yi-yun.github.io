---
title: 几道面试题
date: 2019-03-21 10:46:52
tags:
    - 面试
    - 笔记
    - 知识星球
categories: 面试
---

## 前言
> 复习的时候就想写了，为自己做点笔记，加深印象理解原理吧。

## 题目
> 又一个我的偶像 [CaoZ 老师](
https://www.zhihu.com/question/19596615/answer/12327310)分享在知识星球的片段

1. 从你浏览器输入网址，到网页打开。中间都经历了什么。
2. 如果现在有用户反馈你的网站打开很慢，或者说打不开，你考虑的判断和排查步骤是什么，以及为什么。
3. 现在数据库出现了 too many connections 错误，请问排查思路和后续动作是什么。

## 理解
### 第一题
乍一看像 DNS 题，定睛一看，还是一道 DNS 题。其实不尽然。说下我看完曹老师文章后的理解。

从输入网址，浏览器会检查域名是否在缓存当中，若是国内第三方“良心”浏览器会触发钩子，会跳转微软搜索页面。然后才是本地 host 文件的判断。这个文件映射的是键值对，在 GFW 没有升高之前，我通过更改 hosts 文件还去看了一下世界。当然那时候也不懂什么 hosts，到后来才慢慢接触了解到。

如若本地客户端仍没有完成解析，就会真正请求域名服务器来解析这个域名。首先从网络配置中获取本地 DNS 解析服务器地址，一般不会离得太远，而且性能极好，能完成 80% 的工作。缓存时间根据 TTL 值控制。

若本地 DNS 仍没有命中，需根据本地 DNS 设置（是否含有转发器进行查询）。如果没有转发模式，直接查找根服务器，要求查找该 URL 中顶级域名服务器（gTLD）。然后依次查找权威 DNS 服务器，例如 `github.com` 的权威服务器。之所以叫他权威服务器是因为管理着众多二级域名。他将给本地 DNS 服务器返回一个具体的 IP 地址。本地 DNS 服务器将缓存结果的同时发送给客户端。当然有很多权威服务器做了全局均衡代理，权威服务器将返回众多 IP。客户端 DNS 解析器缓存结果并通过随机或者轮询等机制进行访问。

如果用的是转发模式，本地 DNS 则会将请求转发至上一级 DNS 服务器。上一级则会将请求转发上上一级或者寻找根 DNS。


## 第二题
场景题，虽然还是学生，但是我认为很真实。

首先当然自己打开网站试试喽。如果正常，考虑全国测速，并进行 CDN 全国加速（CDN 部署时个人认为就要加上）。如果慢，一种特殊的情况是 DNS 解析出问题了，直接 IP 访问试试。还可以用 Chrome 开发者工具进行相应的抓包等。

## 第三题
查看连接池日志，当然我也会优先考虑数据库连接有没有 close 的问题，其次是高并发下出现阻塞，导致大量连接被阻塞。然后再查看数据库相关的连接配置。

## 参考链接
- [what-happens-when](https://github.com/alex/what-happens-when)
- [caoz的梦呓](https://mp.weixin.qq.com/s?__biz=MzI0MjA1Mjg2Ng==&mid=209679438&idx=1&sn=d68c1512ad23f6e164f69bd351a18c62&scene=7&ascene=0&devicetype=android-27&version=2607033a&nettype=WIFI&abtest_cookie=BAABAAoACwASABQABAAmlx4AV5keAJuZHgCgmR4AAAA%3D&lang=zh_CN&pass_ticket=IwU%2BrHnkJALzgEGVy5PIkB2lrT7AmStPIpUk58wRR6g%3D&wx_header=1)
- [mysql-error-too-many-connections](https://www.percona.com/blog/2013/11/28/mysql-error-too-many-connections/)
