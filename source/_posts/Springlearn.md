---
title: Spring 学习笔记（一）
date: 2018-12-10 20:13:57
tags:
    - 笔记
    - Java
    - Spring
    - IoC
    - AOP
    - 框架
categories: Spring
---

<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181210201215.png" class="full-image"/>
</p>

## 前言

个人笔记，理解有误请指正
<!--more-->

## 基础

### 理解

- 控制反转
个人理解是将类通过 XML 或者其他形式的配置交给 Spring 管理，而 Spring 通过 Java 的反射机制在运行时进行统一的创建和组装
- 注入依赖
设置属性
    ```XML
    <bean id="test" class="com.yiyun.Spring.Ioc.HelloWord">
        <!--注入数据找 set 方法-->
        <property name="hostname" value="Michael"></property>
    </bean>
    ```

### 元数据初涉
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181204155533.png)
Spring IoC 容器是通过读取配置文件中的元数据来管理 Bean 对象

配置元数据的三种方式
- XML
- Annotation
- Java Config

### 反射

Java 中最重要的概念,下面代码为模拟 Spring IoC 容器管理 Bean 的方法
```Java 
void fun1() throws Exception {
        //IoC 原理（Reflect）
        String path="com.yiyun.Spring.Ioc.HelloWord";
        HelloWord world=null;
        //-----Spring---------
        Class clazz=Class.forName(path);//反射获得字节码
        Constructor con=clazz.getConstructor();
        con.setAccessible(true);//可访问的
        Object o=con.newInstance();
        BeanInfo  beanInfo=Introspector.getBeanInfo(clazz,Object.class);//内省机制
        PropertyDescriptor[] pds=beanInfo.getPropertyDescriptors();
        for (PropertyDescriptor ps:pds) {
            String proper=ps.getName();//获取类中的所有属性
            if("hostname".equals(proper)){
                ps.getWriteMethod().invoke(o,"yi-yun");//调用 Set 方法
            }
        }
        world=(HelloWord)o;
        //
        world.sayHello();
    }
```


### 配置相关
- bean 中 的 id name 在 Spring3.1 之后都是 String 类型,可以用 / 开头
- import 相关
    -  `<import resource="classpath:com/yiyun/Spring/Ioc/IoC.xml"/>`
    - 默认从 classpath 下找
    - 只有在框架中实现了 Resource 接口才能识别 file 或 classpath 等


### 测试
- 传统测试
需要开闭 Spring 并且非正常关闭
- 框架内测试
Spring5 的测试框架是依赖 Junit5,建议用这个快捷方便
    ```Java
    @SpringJUnitConfig//按照测试类路径下，找测试类-context.xml
    @Autowired//自动按照类型去 Spring 寻找 bean 对象,并设置给该字段
    @Test
    ```

## IoC 
### IoC 容器
1. 不建议用 BeanFactory，而是用 ApplicationContext，它继承了 BeanFactory，提供 AOP 集成、国际化处理、事件传播、同一加载等功能
    ```Java
    @Test
    public void fun(){
        Resource resource=new ClassPathResource("com/yiyun/Spring/IoC/App.xml");
        BeanFactory beanFactory=new XmlBeanFactory(resource);
        System.out.println("-----------------------------");
        Person p=beanFactory.getBean("test",Person.class);
        System.out.println(p);
    }

    @Test
    public void fun1() {
        ApplicationContext ctx=new ClassPathXmlApplicationContext("com/yiyun/Spring/IoC/App.xml");
        System.out.println("-----------------------------");
        Person p=ctx.getBean("test",Person.class);
        System.out.println(p);
    }
    ```
2. Bean 创建时机
- BeanFactory 有延迟初始化（懒加载）的特点，在创建容器时，不会立马去创建容器中管理的对象，去获取时才会去创建对象
- ApplicationContext 会立马初始化 Bean

### Bean 四种实例化
1. 构造器实例化（需要无参数构造器，与访问权限无关），最标准，使用最多
1. 静态工厂方法实例化
1. 实例工厂方法实例化
1. 实现 Factory Bean 接口实例化，集成框架使用，例如 MyBatis : org.mybatis.spring.SqlSessionFactoryBean  
    -注： BeanFactory 强调 Bean 工厂，FactoryBean 强调工厂对象
![](https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20181210185514.png)

### Bean 的作用域
默认单例，prototype 为多例，即创建三次且 HashCode 不一样
- Struct1 的 Action 使用的 request，Struct2 的 Action 使用 prototype 类型，其他使用单例

### 实例化和销毁
- init-method 
- destroy-method

细节：
多例模式并不会像单例模式一样去销毁，需要手动销毁，调用 close （美其名曰：节约资源）。
另外，不用 Spring 测试框架的话，资源不会被正常释放，Spring 容器没有正常关闭，需要手动关闭。
- 采用 Lombok @cleanup 注解释放资源
- 把 Spring 线程作为 JVM 的子线程
registerShutdownHook()
