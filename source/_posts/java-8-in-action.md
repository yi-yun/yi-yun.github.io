---
title: Java 8 实战
date: 2019-06-09 22:05:06
tags:
    - Java
    - 学习
    - 代码
categories: Java
---

<p align="center">
<img src="https://yiyun-1253940215.cos.ap-shanghai.myqcloud.com/20190609220916.png" class="full-image" />
</p>

## 前言
很早就想仔细学了，终于有机会记一下笔记……

<!--more-->

## Lambda 表达式
### 函数式接口  
只定义了一个**抽象**方法的的接口，值得注意的是，Java 8 引入了 stream 等方法，但是原先的 Collection 里没有。为了提高效率，接口的设计者就引入了 default 关键字来扩充接口。可用 @FunctionalInterface 标记为函数式接口，类似 @Override。

### 常用的接口
- Predicate  
返回 boolean
- Consumer  
void，适用于 `sout`
- Function  
可以将 T 转化为 R

### 感觉
其实 Java 中就是一个接口实现，如果要扯到函数式编程的话就要扯到 lambda 演算，主要为三条规则：
- 函数定义
- 标识符引用
- 函数应用

~~说人话~~

我的理解是这三条规则为定义一个变量和函数，然后告诉你定义完了怎么去使用它

举个难一点的栗子（PS：为什么要举难一点的例子……~~答：装逼~~）
```lisp
(lambda x y. x y) (lambda z . z * z) 3 
```

## 流
> 从支持数据处理操作的源生成的元素序列

用过的人都说好……

### 定义
- 内部迭代  
将迭代封装在内部，例如
    ```java
    Dish.menu.stream().map(Dish::toString).collect(Collectors.toList());
    Dish.menu.stream().forEach(System.out::println);
    ```
- 使用规则
    - 数据源（例如集合）
    - 中间操作链
    - 终端操作
- 流只能遍历一次，只能消费一次

### 创建
```java
// Stream.of
Stream.of("Java 8", "Lambdas", "In", "Action").map(String::toUpperCase).forEach(System.out::println);
// Stream.empty
Stream<String> emptyStream = Stream.empty();
// Arrays.stream
int[] numbers = {2, 3, 5, 7, 11, 13};
System.out.println(Arrays.stream(numbers).sum());
```
### 使用
#### 筛选和切片
- filter
- distinct  
筛选互异元素
- limit  
取前几个元素
- skip  
跳过前几个元素

#### 映射
- map
- flatMap  
将流中的每个值都换成另一个流，然后把所有的流连接起来成为一个流，个人理解为将流里的值继续转换为子流然后连接。
    ```java
    List<Integer> list1 = Arrays.asList(1, 2, 3);
    List<Integer> list2 = Arrays.asList(4,5);
    list1.stream().flatMap(i->
       list2.stream().map(j->new int[]{i,j})
        ).forEach(t-> System.out.println(t[0]+","+t[1]));
    ```
- mapToInt

#### 查找和匹配
短路操作，找到一个符合条件的立即返回
- anyMatch  
至少匹配一个
- allMatch  
都匹配
- noneMatch  
没有匹配的
- findAny
- findFirst  
与楼上有并行的区别，findAny 不一定是返回第一个

#### 规约
使用 reduce，第一个参数为初始值，第二个为执行函数直到规约到一个数

### 细节
- 数值流以及对象流相互的转化
    - IntStream
    - LongStream
    - DoubleStream
    ```java
    int calories = menu.stream().mapToInt(Dish::getCalories).sum();
    menu.stream().mapToInt(Dish::getCalories).boxed();
    ```
- 数值范围
    - rangeClosed
        ```java
        long count = IntStream.rangeClosed(1, 100).filter(d -> d % 2 == 0).count();
        ```
    - range  
    不包括结束值

### 收集器
> 前面的都是小儿科，在开发人员的代码里很多都是收集器
#### 规约与汇总
- counting
- maxBy  
需要实现 Comparator
- summingInt/summingLong/summingDouble
- averagingInt/averagingLong/averagingDouble
- summarizingInt/summarizingLong/summarizingDouble
- joining

##### 实现
通过 reducing() 实现，需要三参数，单参数为三参数的特殊情况，起点为第一个项目，转换函数为恒等函数，第三个为函数计算
```java
menu.stream().map(Dish::getName).collect(joining());
menu.stream().map(Dish::getName).collect(reducing((s1,s2)->s1+s2)).get();
menu.stream().collect(reducing(" ",Dish::getName,(s1,s2)->s1+s2));
```

#### 分组
> groupingBy  

- 单参数 groupingBy(f) 实际是 groupingBy(f,toList()) 
- 双参数，第二个参数为任意类型的收集器，也可为 groupingBy(f)
- 常用的联合使用收集器为 summingInt,counting,mapping 等
- 隐含参数可为 toSet()

#### 分区
> 特殊的分组，分区函数返回 boolean

#### 接口
- `Supplier<A> supplier()`
- `BiConsumer<A, T> accumulator()`
- `Function<A, List<T>>()`
- `BinaryOperator<A> combiner()`
- `Set<Characteristics> characteristics()`

#### 自定义收集器

单纯的能看懂……


### 并行

- 避免共享状态
- 留意装箱
- limit 和 findFirst 依赖元素顺序

PS：如果想提高效率，自行实现 Spliterator 接口  
~~为什么就一句话，因为我不太会~~


## 默认方法
> Ootional说下个人理解，接口中引入了 default 关键字，使接口更新更加平滑，不需要更改已经编译出来的客户端 clas 文件，只需在上游添加默认方法即可。
~~其实官方就是为了方便引入 stream，防止升级之后出现客户端代码崩溃的问题~~ 

## Optional
> 这个竟然在面试中被问到了，1.8 之后处理异常有什么改进。虽然有了解过，但是竟然被问懵了，还有区别？？？后来经过提醒才意识到原来他问的是空指针处理的 Optional……

### 他山之石
在很早之前~~好像是《七周七语言》里（具体我忘了哪本书）~~看到的说语言的设计者很痛恨引入空指针这个概念，因为程序员在业务中需要去进行繁琐的判断，后来才设计出 Haskell 的 Maybe 类型。  
像 Groovy 处理就直接引入安全导航操作符，若引用链中有空指针传递下去，返回一个 null。

### 可以攻玉
```Java
public String getCarInsuranceName(Optional<Person> person) {
        return person.flatMap(Person::getCar)
            .flatMap(Car::getInsurance)
            .map(Insurance::getName)
            .orElse("Unknown");
    }
```

### 细节
在设计时没有考虑将其作为类的字段使用，没有实现 Serializable 接口，无法序列化  
替代方案如下
```Java
public class Car {
    private Insurance insurance;
    public Optional<Insurance> getInsuranceAsOptional() {
        return insurance;
    }
}
```

### 个人感受
有点类似流，但不同于流的是它只是个对象，如 filter 是对对象属性的操作


## CompletableFuture
工厂方法  
CompletabelFuture.supplyAsync();
- 异步操作，相比于并行的 stream 可以自定义线程池，适用于 I/O 密集型任务
- 管理异常
- 可以将异步任务合并  
`thenCombine`
- 注册回调函数  
`thenAcecpt`
- 决定程序运行  
`allOf` `anyOf`

## 时间
- LocalDate
- LocalTime
- LocalDateTime


未完待续……