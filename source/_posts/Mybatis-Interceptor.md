---
title: Mybatis 拦截器的简单实现
date: 2019-08-04 16:44:41
tags:
    - 学习
    - Mybatis
    - Interceptor
    - 框架
    - Java
categories: Java
---

<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190804164802.jpg
" class="full-image"/>
</p>

## 前言
需求驱动学习，最近一周组长让我在业务模块里加日志，经过与导师以及组长讨论决定用拦截器记录日志。周五下班前已经发了提测邮件。

虽然我知道 MyBatis 有这东西，但是没在实际情况中用过，心里有点虚2333……所以才有了此文的理解。

<!--more-->
## 前世今生
它的本质就是 JDK 的动态代理。首先先来复习一下动态代理我贴了一段最常见的 JDK 动态代理的代码
```java
//服务员的接口
public interface Waiter {
    void serve();
}
//服务员的实现
public class WaiterImpl implements Waiter {
    @Override
    public void serve() {
        System.out.println("服务中...");
    }
}
//需要代理的对象处理器
class WaitInvocationHandler implements InvocationHandler {
    private Waiter waiter;

    public WaitInvocationHandler(Waiter waiter1) {
        waiter = waiter1;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("你好");
        Object invoke = method.invoke(waiter, args);
        System.out.println("再见");
        return invoke;
    }
}
public class App {
    //普通的实现
    @Test
    public void fun() {
        Waiter waiter = new WaiterImpl();
        waiter.serve();
    }

    @Test
    public void fun1() {
        Waiter a = new WaiterImpl();
        ClassLoader classLoader = getClass().getClassLoader();
        Class[] classes = {Waiter.class};
        //生成代理对象
        Waiter waiterproxy = (Waiter) Proxy.newProxyInstance(classLoader, classes, new WaitInvocationHandler(a));
        waiterproxy.serve();
    }
}
```
## 拦截器
### V1
我现在要在函数执行前后记录日志操作，考虑需要在代理方法那里定义个拦截器的接口，如下代码所示
```java
//拦截器 V1 版本
public interface MyInterceptorV1 {
    void interceptor();
}
//代理对象变成这个
public class TargetProxyV1 implements InvocationHandler {

    private Target target;

    private MyInterceptorV1 myInterceptor;

    public TargetProxyV1(Target target, MyInterceptorV1 myInterceptor) {
        this.target = target;
        this.myInterceptor = myInterceptor;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        myInterceptor.interceptor();
        return method.invoke(target, args);
    }
}
```
这是最简单的版本，但是我们很多时候需要拦截参数等根据参数判断拦不拦截等，代码更新如下
```java
public interface MyInterceptorV1 {
    void interceptor(Method method, Object[] args);
}

@Override
public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
    myInterceptor.interceptor(method, args);
    return method.invoke(target, args);
}
```

### V2
似乎上面的方案很完美 ~~废话肯定不完美，不然怎么会有这段~~

没错，第二段代码并不是很优雅，有方法参数重复，可以考虑将三者抽出来，直接在拦截器的实现里写上`method.invoke(target, args);`，如下代码所示
```
@Getter
@Setter
@AllArgsConstructor
public class MyInvocation {
    private Object target;
    private Method method;
    private Object[] args;

    public Object proceed() throws InvocationTargetException, IllegalAccessException {
        return method.invoke(target, args);
    }
}
//没错这就是 V2 版本
public interface MyInterceptorV2 {
    Object interceptor(MyInvocation invocation) throws Throwable;
}
```

## 总结

Mybatis 的拦截器就是像我上面这么写的，~~名字也跟我取得一样，~~只是它更加复杂，能够通过注解区分拦截 `update` 操作和 `query` 等操作。

既完成了任务又巩固了原来的知识，这种感觉很棒，最关键的是还有钱拿……

[本文代码](https://github.com/yi-yun/JavaExercise/blob/master/java_se/src/main/java/com/yiyun/proxy/mybatis/App.java)