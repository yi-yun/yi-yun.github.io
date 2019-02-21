---
title: 清除 Git 敏感信息
date: 2019-02-21 20:23:55
tags:
    - 笔记
    - GitHub
    - Git
    - 工具
    - Arch
categories: 代码协作
---

## 前言
算是 Git 的奇淫怪技

<!--more-->

## 背景
偶然在水群时看到一条消息，有人将服务器密码提交到了 Git 记录上。众所周知，公有仓库的 Git 记录是所有人可见的。所以一旦有敏感信息，不法分子就可以从你的 commit 记录中寻找突破口。

## 解决
### Git 命令行
```shell
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch sensitive-data.py' --prune-empty --tag-name-filter cat -- --all
git push origin --force –all
```

这是我谷歌的命令，大概是在 Git 记录中删除带有敏感信息的文件，然后强制 push

### BFG
那么有没有更优雅的方法呢，答案是肯定的。

如标题所言，[BFG Repo Cleaner](https://rtyley.github.io/bfg-repo-cleaner/) 能帮到我们。该工具是用 Scala 写的，专门为清除 Git 提交记录中带有敏感信息而产生的。

#### 使用

> 需要 Java 7 以上版本

- 安装以及使用
    - 点[此](https://mvnrepository.com/artifact/com.madgag/bfg)下载 jar 包  
    `java -jar bfg.jar 命令参数`
    - yay -S bfg  
    `bfg 命令参数`

如上所示，有两种安装方式，第一种是通用的运行下载的 jar 包，另一种是为 Arch 用户准备的...~~（这时候就要喊出“Arch 牛逼”）~~因为我是 Arch 忠实粉丝，所以就以 Arch 中的命令作为示范...

#### 测试

在 GitHub 仓库中创建一个专门来测试的仓库（我学 Git 的时候就已经有一个专门用来测试 Git 的仓库），将密码假装不小心上传到 GitHub。

当发现后，重新将密码去除后重新提交到 GitHub。此时，如果不看 commit 记录就不会知道历史版本，bfg 这个工具就为了防止有心人通过你的 commit 记录捕获你的敏感信息
- 克隆仓库的 .git 文件夹
    ```
    git clone --mirror git@github.com:yi-yun/git777github-learn.git
    ```
- 在本地创建 replace.txt
文本名字是任意的，文本内容需要将密码填上，默认替换成 `***REMOVED***`，也可以将其替换成自己想要的字符，规则如下所示
    ```txt
    PASSWORD1                       # Replace with '***REMOVED***' (default)
    PASSWORD2==>examplePass         # replace with 'examplePass' instead
    PASSWORD3==>                    # replace with the empty string
    regex:password=\w+==>password=  # Replace, using a regex
    regex:\r(\n)==>$1               # Replace Windows newlines with Unix newlines
    ```
- 执行命令  
需要注意两点，一是文本名字与路径，二是相关参数，也可用 `--replace-text`
    ```shell
    bfg -rt ~/replace.txt git777github-learn.git
    ```
- 提交更改
    ```shell
    cd git777github-learn.git
    git reflog expire --expire=now --all && git gc --prune=now --aggressive
    git push
    ```
#### 拓展  
这货还能删除大文件，有需要的童鞋可以参考[官网](https://rtyley.github.io/bfg-repo-cleaner/)

## 参考
- [官网](https://rtyley.github.io/bfg-repo-cleaner/)
- [清除历史提交记录中的敏感信息](https://debugtalk.com/post/clean-sensitive-data-from-git-history-commits/#%E9%98%85%E8%AF%BB%E6%9B%B4%E5%A4%9A)
- [不小心把密码上传到 GitHub 了，怎么办](https://www.bennythink.com/git-password.html)