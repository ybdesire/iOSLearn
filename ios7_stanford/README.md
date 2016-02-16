# class1

创建一个OSX Application ‘Command Line Tool’项目
* IDE: Xcode 7.2 (7C68)

学习OC语法，主要写Card类（Card.m + Card.h）
* 在.h中，写这个类要暴露出来的API方法声明
* 在.m中，写类的方法实现，与类的私有方法
* 尽量用nonatomic的属性，而非变量实例（便于指针初始化，以及将来向getter/setter中添加内容）
* 发送消息有两种方法： 方括号、点号


# class2

接着class1的代码来
继续添加Deck类（一副牌）
* 函数名由多个字段组成：addCard atTop
* 函数重载：addCard atTop/ addCard
* property初始为nil
* 惰性初始化（不是在ctor中初始化）
   * 优点： 能让ctor中垃圾更少，用的时候才申请内存而不是向ctor开始就申请一大堆内存
   * 实现： 在getter中来申请内存
   * 注意： 这是OC开发的习惯，不要把property初始化放在ctor中做
* OC自动对属性cards做出@synthesize cards = _cards，所以直接用_cards就可以访问到cards


添加PlayingCard类
* NSUInteger在iPhone5是64位，iPhone4以下是32位
* PlayingCard继承于Card类
   * Card的property contents 就被继承下来
* @符号： 编译器会为@的字符串创建字符串对象
* 若 setter和getter都被重写，编译器就不会生成_suit，所以不能直接用带下划线的变量，必须手动synthesize
* +号方法：静态方法, 注意其调用方式[类名 方法名]


