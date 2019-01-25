---
title: Arch Linux 安装手记
date: 2019-01-25 16:24:09
tags: 
    - Arch
    - Linux
    - 收获
    - 安装
    - 笔记
categories: 日常记录
---

<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190125001003.jpg" class="full-image" width=35%/>
</p>

## 前言
> 用户友好都是狗屁，用户中心才是王道。

Arch 将这句话解释得淋漓尽致。

<!--more-->

## 介绍
> 这是一段科普 Arch 的文字

Arch 拥有我见过的迄今为止最丰富的 Wiki~~（维基百科：？？）~~。与此同时，它的第三方仓库 aur 则是将开源的力量发挥到了极致。你见过一行命令就能在 Linux 上安装 QQ、TIM、微信、百度云和迅雷极速版么？另外，Arch 的社区也不输给其他发行版。相信我，你不会后悔装 Arch Linux 的。

我很庆幸第一台使用的主力 Linux 系统是 Arch Linux，因为它让我结识了很多朋友，也让我在 Linux 方面有更多的理解。

PS：如果你是新手，建议你先安装 Manjaro，这是 Arch 的衍生版，开箱即用，图形化界面安装，只需少量配置即可入我 Arch 神教。

## 准备
- 磁盘空间
- 一个 U盘
- 最好有根网线
- 看过 [Wiki 安装教程](https://wiki.archlinux.org/index.php/Installation_guide)（左侧可切换语言）

### 刻录
1. 去 [163 镜像源](http://mirrors.163.com/archlinux/iso/)找日期最近的镜像下载（PS：最近日期的镜像可以减少包的更新）
2. 用 [Rufus](https://rufus.ie/) 或者其他的刻录软件将 U盘 制作成启动盘

### 引导方式
- UEFI/GPT
- BIOS/MBR

上面是是常见的两种引导方式，斜杠右边是引导方式所对应的硬盘格式，你需要搞清楚自己电脑的引导方式。如果你想装双系统更得注意。

### 磁盘空间
将预计安装 Arch 的磁盘整个分区格式化，然后考虑磁盘分配。接下来是一位曾经划分磁盘空间不够的博主给你们的忠告
1. 如果你预留的空间小于 100G，请不要划分什么 /home 分区，除非你只是实验。因为你把握不好大小，即使要划分，请把根目录划的大一点，起码六四开。
2. 磁盘空间不够，请不要另外划分 /var 等分区，因为你不知道到底需要多大，到时候很麻烦
3. 最好另外留 1G 空间给 /boot，我不喜欢划分交换空间，而喜欢采取交换文件的形式，因为交换文件可大可小（滑稽）

综上，1G /boot，剩下的留给根目录，老玩家请随意...

## 安装
> 电脑引导方式是 BIOS，就拿它来举例，UEFI 无非是要多挂载一个分区

### U盘启动
记得插上网线，每台电脑的 U盘 快速启动不一样，选对 U盘 则会看到下面这个界面

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/c2efb44313b8.gif)


### 连接网络
> 当然是 `ping -c 4 www.baidu.com`，百度别的不好，但他是最好的测网络连通性的网站

- 有线连接  
dhcpd
- 无线连接  
输入 wifi-menu，如果名称有中文可能会乱码，我偶尔还会连不上，所以推荐有线

### 更新系统时间
```bash
timedatectl set-ntp true # 如果是双系统会涉及到时间不同步的问题
```

### 修改镜像文件
1. 输入 `vim /etc/pacman.d/mirrorlist`
2. 输入 `/China` 回车将光标移动到对应的网址，依次输入`dd`、`gg`、`Shift P`
3. 输入 `:wq` 保存退出


### 磁盘分区
> 最重要的一块内容，难就难在这里

1. 输入 `fdisk -l` 查看现有可操作磁盘
2. 找到选中的磁盘，例如我选中了 sdb
3. `cfdisk sdb` 图形化操作磁盘空间
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190125181308.png)
4. 我的分区是 `/boot`(Type:EFI)、`/`(Type:Linux )。记得操作完选择 write
5. `mkfs.ext4 /dev/sdb3` 格式化你相对应的根分区

### 挂载分区

挂载就是把额外添加的磁盘分区(这里我们指的就是刚刚格式完的硬盘分区)指定在特定的文件夹下，当我们打开这个文件夹的时候，文件夹的空间大小就是使用该分区的存储空间。

`/mnt` 文件夹是 Linux 专门挂载用的，挂载后，会在mnt里多出相应设备的目录。由于我们目前所有操作都还在 U盘 里，所以需要把磁盘分区挂载到 U盘 下的 `/mnt` 下，才能进入分区进行系统安装和配置。

下面是个例子
```bash
mount /dev/sdb3 /mnt # 挂载根分区
mkdir /mnt/boot # 创建文件夹
mount /dev/sdb2 /boot # 挂载 /boot 分区
```

挂载好可以输入 `lsblk` 查看下挂载结果


### 安装系统
> 需要有网

```bash
pacstrap /mnt base base-devel # 安装系统
genfstab -U /mnt >> /mnt/etc/fstab # 生成卷标
arch-chroot /mnt    # 进入/mnt下的系统
```

## 设置系统
> 需要对刚刚装好的系统 Arch Linux 进行必要的配置，后面操作的都是对硬盘上的 Arch Linux 操作

### 设置时间
```
ln -sf /usr/share/zoninfo/Asia/Shanghai /etc/localtime  # 设为上海时间
hwclock --systohc --utc  # 设置硬件时间
```

### 修改编码
1. `pacman -S vim   #安装vim`
2. `vim /etc/locale.gen`
2. 找到 `en_US.UTF-8` 和 `zh_CN.UTF-8`，把前面的#号删除，`:wq` 保存退出
2. `locale-gen  #重新生成locale`
3. `echo LANG=en_US.UTF-8 > /etc/locale.conf`

### 主机名称

> 偷个懒

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190125155852.png)

- `passwd # 设置 root 密码`

### 必要软件
```bash
pacman -S networkmanager ntfs-3g os-prober grub
systemctl enable NetworkManager # 后面三个是引导需要的
```

### 安装引导
```bash
grub-install --target=i386-pc /dev/sdx （将sdx换成你安装的硬盘）
grub-mkconfig -o /boot/grub/grub.cfg
```

双系统需要安装 `os-prober` 以及 `ntfs-3g` 后 grub 生成引导入口时就会检测出 Win10

![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190125180817.png)

PS:如果报 `warning failed to connect to lvmetad，falling back to device scanning` 错误。简单的方法是编辑 `/etc/lvm/lvm.conf` 这个文件，找到 `use_lvmetad = 1` 将1修改为0，保存，重新配置 grub。

## 完成

```bash
exit    # 退出新系统回到启动盘系统
umount -R /mnt # 取消/mnt挂载
reboot # 重启
```

注意这个时候你可能会卡在有两行提示的地方无法正常关机，长按电源键强制关机即可

## 参考文章
- [Arch Wiki](https://wiki.archlinux.org/index.php/Installation_guide)
- [以官方Wiki的方式安装ArchLinux](https://www.viseator.com/2017/05/17/arch_install/)
- [系统安装篇](https://teaper.github.io/archlinux-installation-instructions/SYSTEMINSTALL.html)