---
title: Git 使用
date: 2018-10-20 21:44:00
tags: 
    - Git
    - 奇淫怪技
    - 配置笔记
    - 软件
    - 博客
categories: 代码协作
---


<p align="center">
    <img  src='https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181020203310.png' class="full-class">
</p>


## 写在前面

主要是简单的 Git 命令介绍，初衷是看完这篇文章能直接上手在 GitHub 上 `New pull request` 进行项目开发

<!--more-->

## 多平台初始化

**极其重要，不然 merge 时代码会很乱**

1. 编辑器改成（UX）模式
    - 换行符采用 LF
    - UTF-8 编码

1. Git 命令行配置
    - `git config --global core.safecrlf true`
    - `git config --global core.autocrlf false`  

原因见[链接](https://github.com/cssmagic/blog/issues/22)

## 多人协作

本文采用的是 pull request 的方式，因为这样可以进行 code review

1. Fork 源仓库
点击 `Fork` 按钮将项目复制到自己的仓库

1. 拉取本地仓库
用 `git clone 项目地址` 到自己电脑上，嫌慢的朋友见[这里](#设置代理)

1. 开发
你可以在 master 分支上开发，也可以再新建一个 dev 分支（看项目大小以及简易程度）
开发完以后，`git add . && git commit -m '注释' && git push `

1. 创建合并请求
打开网页进入 Fork 的项目，然后点击 `New pull request`，最后点击 `Create pull request` 按钮，添加一段注释，源仓库的管理员就能收到你的请求
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181020212913.png)

1. 同步
如果过了一礼拜作者或其他人员对仓库的代码进行了修改，源代码变了，你本地的代码还是前几天的。  
这时候你需要使用 Git 命令 `git fetch 源仓库地址 master:分支名` （分支名自己取，不建议直接拉取到主分支），然后 `git merge 分支名` 即可同步代码（有冲突就处理冲突）

## 一些小技巧

### 设置代理

GayHub 被墙的厉害，这步以及下步没有代理的忽略

`git config --global http.proxy 'socks5://127.0.0.1:1080'`  
`git config --global https.proxy 'socks5://127.0.0.1:1080'`

因为访问 GitHub 走的代理，用 https 连接的主机提交会有点问题，可以使用 ssh 链接提交。更改主机连接方法点[这里](#更改远程仓库指向-remote-url)

### 取消代理

`git config --global --unset http.proxy`

`git config --global --unset https.proxy`

### 更改远程仓库指向 remote url

- `git remote set-url origin yoururl`
- `git config -e`  熟悉 vim 的朋友可以使用，最后记得保存（个人喜欢这种方式）
