---
title: Java 并发入门
date: 2019-04-11 12:00:46
tags:
    - Java
    - 多线程
    - 面试
    - 春招
categories: Java
---

<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190411120437.jpg " class="full-image"/>
</p>

## 碎碎念
> ~~拖更一时爽，一直拖更一直爽~~

最近忙于找实习以及挑战杯省赛，两者聚在一起当然就忙得不可开交。关于省赛，前几篇文章也有提到，其实我是不太愿意花时间搞的，但是命运使然，只好寻找某一平衡点喽。
<!--more-->
## 概念
> 介绍一些概念，当然也为了使自己印象深刻

### 线程
操作系统调度的最小单元，一个进程中的所有的线程都有完全一样的地址空间，意味着共享同样的全局变量。

### 上下文切换

CPU 分配给各个线程时间片，但因为时间片很短，所以 CPU 不停的切换线程。但是 CPU 切换前会保存上一个任务的状态（进程状态、优先级、程序 I/O 的状态、文件描述符等）到内存，以便下次切换回这个状态。

#### 解决方案
> 多次上下文切换会影响多线程执行速度

- 无锁并发编程
- CAS 算法
- 使用最少线程
- 协程

## 线程间通信
> 等待/通知的经典范式

- 等待方
    ```java
    synchronized(对象){
        while(条件不满足){
            对象.wait();
        }
        对应的处理逻辑
    }
    ```
- 通知方
    ```java
    synchronized(对象){
        改变对象
        对象.notifyAll();
    }
    ```

## Thread.join()
> 线程 A 执行了 thread.join() 语句时表示，当前线程 A 等待 thread 线程终止之后才从 thread.join() 返回。

## ThreadLocal
> 个人看源码理解就是在虚拟机栈中存着引用，真正存值的是 ThreadLocalMap。而 ThreadLocalMap 内部用 Entry 存放 K-V，哈希冲突则采用的是开放寻址法。
另外，ThreadLocal 在线程池里容易存在内存泄漏，因为只要线程被 GC 回收，即使弱引用 Key 的值为 null，一般不会内存泄漏。就怕线程池回收利用，Key 为 null 了，value 则还有值。解决方法就是调用 remove() 方法，将值设置为 null。