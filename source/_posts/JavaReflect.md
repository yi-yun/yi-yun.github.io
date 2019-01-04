---
title: Java 反射
date: 2019-01-04 19:38:54
tags:
    - Java
    - 笔记
    - 学习
categories: Java
---
<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190104194136.png" class="full-image" width=650/>
</p>


## 前言

反射应用在一些通用性比较高的代码，后续学框架或多或少是有反射的。一开始反射看不懂没关系，但要有初步印象。我是通过后来的框架的学习才明白反射真牛！
<!--more-->

## 原理

> 开发时，框架大都用过配置文件来配置。在配置文件中配置了类，可以通过反射得到类的所有内容，还可以让类中的某个方法来执行

> 什么玩意？

> 说白了就是告诉你一个路径，你能获取整个类里的内容。那么，类里的内容包括什么呢

- [构造器](#构造器)
- [属性](#属性)
- [方法](#方法)


## 代码

准备一个测试类
```Java
package com.yiyun.excrice.Reflect;
public class Person {
    private int id;
    private String name;

    private Person(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public Person() {
    }
    
    public void eat(String  something){
        System.out.println("正在吃" + something);
    }
    
    private void speak(String message){
        System.out.println("正在说" + message);
    }
}
```


### 构造器

```java
public class testReflect {
    public static void main(String[] args) throws Exception {
        //获取Class 对象
        Class clazz=Class.forName("com.yiyun.excrice.Reflect.Person");

        //获取一个实例， jdk9中已过时
        Object obj=clazz.newInstance();
        System.out.println("obj = " + obj);

        
        //因为权限是私有，但getConstructor()只能获取public修饰的方法getDeclaredConstructor():获取声明的方法。只要声明的就可以
        Constructor<?> constructor=clazz.getDeclaredConstructor(int.class,String.class);
        System.out.println("constructor = " + constructor);
        //newInstance会产生非法访问异常：java.lang.IllegalAccessException
        constructor.setAccessible(true);// 暴力反射私有构造器
        
        Object obj1=constructor.newInstance(1,"lisi");
        System.out.println("obj1 = " + obj1);
    }
}
```

### 方法

```java
@Test
public void methodTest() throws Exception{
    //得到类对象（可以想象成模板，有了模板你才能去造其他东西）
    Class clazz=Class.forName("com.yiyun.excrice.Reflect.Person");
    
    //得到声明的方法
    Method method=clazz.getDeclaredMethod("speak",String.class);
    method.setAccessible(true);//暴力反射
    
    //这个方法需要一个实例
    // 静态方法不用，因为即使不 new 对象也可以调用，所以当执行静态方法时设置为 null也可以
    method.invoke(clazz.newInstance(),"hello,yi-yun");
}
```

### 属性
```java
@Test
public void fieldTest() throws Exception{
    //获取Class 对象
    Class clazz=Class.forName("com.yiyun.excrice.Reflect.Person");

    Field field=clazz.getDeclaredField("name");

    field.setAccessible(true);

    Object obj=clazz.newInstance();
    field.set(obj,"yi-yun");
    System.out.println("obj = " + obj);
}

```

## 补充

### 暴力反射
以下都是摘自于极客时间《Java核心技术36讲》
- 框架运用反射能给实体类在运行时生成 set/get 的方法
- 绕过 API 访问限制

但是在 Java9 以后，这个方法的使用可能会存在一些争议，因为 Jigsaw 项目新增的模块化
系统，出于强封装性的考虑，对反射访问进行了限制。Jigsaw 引入了所谓 Open 的概念，只有
当被反射操作的模块和指定的包对反射调用者模块 Open，才能使用 setAccessible；否则，被
认为是不合法（illegal）操作。如果我们的实体类是定义在模块里面，我们需要在模块描述符中
明确声明：
```java
module MyEntities{
    //open for reflection
    opens com.mycorp to java.persistence;
}
```

## 总结
其实，思路很简单


1. 先获取 Class 对象
2. 通过 Java 内置的方法以及 Class 对象去得到操作类的方法或属性名
3. 操作上面一步得到的东西，得到你想要的结果