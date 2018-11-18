---
title: MySQL 安装配置
date: 2018-11-18 17:32:47
tags: 
    - MySQL
    - 软件
    - 配置笔记
    - Windows
    - MySQL
categories: win 配置
---
<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118174107.png" class="full-image"/>
</p>

## 前言

扯淡：从开始想的一周一更变成了一月一更······

此篇博客记录 Windows10 下的 MySQL 安装以及爬坑过程。我们安装的 MySQL 版本是 mysql-essential-5.6.0-m4-win32，就安装的每个步骤，说明每个对应选项的内容。

<!--more-->

## 安装

**注意要以管理员身份运行！！！**

1. License Agreement 打钩，Next
2. 选择安装目录，可以点击 Change 自主修改，比如E:\Program Files (x86)\MySQL\MySQL Server 5.6\
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118162629.png)
1. 点击 Install，安装结束后，打钩 Configuration Wizard，开始配置数据库
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118162730.png)

## 配置

1. 配置类型选择 Detailed Configuration 选项
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118162818.png)
1. 机器类别选择，开发模式 Developer Machine
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118162913.png)
1. 选择 Multifunctional Database，Next
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118162951.png)
1. 设置 Tablespace 的目录到 E 盘的\MySQL Datafiles\
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118163137.png)
1. Server Instance 设置为 Manual Setting 默认数值15
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118163237.png)
1. 数据库的端口默认为 3306
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118163307.png)
1. Character Set 默认设置为 Standard Character Set 
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118163339.png)
PS：涉及[编码问题](#编码)，后面会讲，可先设置为标准
1. Service 名称默认为 MySQL，并且将可运行程序的目录包含在 PATH 目录中
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118163438.png)

1. 数据库根用户的密码设置，即安装数据库后的第一个用户的密码设定，类似于 Windows 安装时的 root 用户密码设定
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118163459.png)

1. 数据库配置设定完毕后，点击 Execute 后，进行配置
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181118163547.png)

## 常用命令介绍
- 登录
以管理员身份运行 CMD 或者 PowerShell，输入 `mysql -u root -p`，在接下来输入刚刚设定的密码即可进入控制台
因为是以管理员身份安装的，所以要以管理员身份运行数据库。个人猜测跟环境变量有关。

- 查看数据库
`show databases;`
 
- 选择数据库
`use 数据库名字;`

- 查看数据库中的表
`show tables;`

## 问题

### 假死
在最后一步执行 Excute 的时候会发生假死现象，原因是没有以管理员身份运行或者是 Win10 的版本兼容性问题。

解决方案：不用卸载，安装好了，只是配置的时候卡了。个人建议先等，如果等了十多分钟还没好，去安装目录下找到 `MySQLInstanceConfig.exe` 这个程序右键以管理员身份运行重新配置。

### 编码

如果按照上面来的话，默认编码时拉丁文，拉丁文不支持中文字符。这个编码问题不处理好，会为之后的学习造成很大的影响（我就是其中一个）

原理：Windows 最蛋疼的点是它的终端是 gbk 编码，什么你要改成 utf-8 编码？不存在的！对，没错，我知道终端右键设置能改，但是没啥用重启环境变量后还是 gbk，所以还要改注册表。你不如直接修改数据库的客户端编码呢!

解决方案：找到 MySQL 安装目录下的 my.ini 文件，修改对应的编码
```ini
character-set-server=utf8
default-character-set=gbk
```

还不行的话请看[编码问题视频](https://www.bilibili.com/video/av20652930/?p=299)


## [点我下载](https://caomsacid0-my.sharepoint.com/:u:/g/personal/yi-yun_caoms_ac_id/Eab6Aj1vPsxOsbINnuZ1wxcBySW_ANSjSA0nwcza37lpiQ?e=DISgby)