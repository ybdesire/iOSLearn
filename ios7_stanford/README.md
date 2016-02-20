# Ref

* slide: http://web.stanford.edu/class/cs193p/cgi-bin/drupal/downloads-2013-fall


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


PlayingCardDeck类
* init()继承自NSObject
   * - (instancetype) init {}
* init()总是返回self 
* 关于init的强制规定
   * 创建一个X实例(50%都用这种方法)： [[X alloc] init]
   * 除非外面有init，否则永远别再里面调用alloc
   * 除非里面有alloc，否则永远别再外面调用init，并且调用init不能多于一次


Xcode讲解
* M - 之前写的那些类
* V - storyboard
* C - ViewController.h/ ViewController.m


Xcode工程
* iOS->Single View Application
* AppDelegate.h/ AppDelegate.m 多任务处理时用
* 在storyboard上加上一个button，拖入一张图片
* 按住control键，将button拖到controller中的implementation区
* 按住Option键+鼠标指向代码，展开代码说明，根据说明里的链接进入Apple自己的离线说明文档
* Option+双击，直接进入说明文档
* 添加一个Lable，按住control，将Lable


课后看class2的slide
* 下载地址：http://web.stanford.edu/class/cs193p/cgi-bin/drupal/system/files/lectures/Lecture%202_1.pdf
* NSString
```
//内容比较
NSString *contents；
[contents isEqualToString:otherContents]

//格式化
[NSString stringWithFormat:@"%d%@", self.rank, self.suit];
```

* 调用类内成员函数，通过self
```
[self addCard:card atTop:NO];
```

* NSMutableArray
```
@property (strong, nonatomic) NSMutableArray *cards;//存储这副牌的所有扑克牌,初始cards为nil

//插入元素
[self.cards insertObject:card atIndex:0];//插入内容到头部
[self.cards addObject:card];//直接添加到尾部

//移除元素
[self.cards removeObjectAtIndex:index];

//得到Array大小
[self.cards count]
```

* 在getter中做初始化
```
@property (strong, nonatomic) NSMutableArray *cards;//存储这副牌的所有扑克牌,初始cards为nil

- (NSMutableArray *)cards
{
if(_cards==nil)//记住这里OC会自动给出 @synthesize cards = _cards，cards是_cards的别名
{
_cards = [[NSMutableArray alloc] init];
}
return _cards;
}
```
* 得到一个小于N的随机正整数
```
unsigned index = arc4random() % [self.cards count];

```

* Array
```
//suit是否在array中
[@[@"♥",@"♦",@"♠",@"♣"] containsObject:suit]
```


# class3

纸牌游戏中的核心逻辑都应该放在Model，而不是Controller
Model中不能有任何跟用户界面相关的事情

可以将public中的readonly property声明为private中的readwrite
``` 
.h中
@property (nonatomic, readonly) NSInteger score;

.m中

```

homework 
* 匹配三张牌


#class4

创建对象的方法
``` 
//1. 利用alloc和init (apple越来越偏向这种方式)
NSMutableArray *cards = [[NSMutableArray alloc] init];
CardMatchingGame *game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];

//2. 利用class自带的方法
NSString
+ (instancetype)stringWithFormat:(NSString *)format

UIButton
+ (instancetype)buttonWithType:(UIButtonType)buttonType

NSMutableArray
+ (instancetype)arrayWithCapacity:(NSUInteger)numItems

NSArray
+ (instancetype)arrayWithObject:(ObjectType)anObject

//3. 让另一个对象为你创建对象
NSString
- (NSString *)stringByAppendingString:(NSString *)aString

``` 

向nil对象发送消息，在大部分情况下是可行的
``` 
int i = [obj methodWhichReturnsAnInt];//如果obj=nil，且方法返回一个数值，则返回0（i等于0）
CGPoint p = [obj getLocation];//如果obj=nil，且方法返回一个结构，则返回一个undefined的值（p值不确定）
``` 

**动态绑定（Dynamic Binding）**
* OC中有一个非常重要的类型：id（指针，指向类型未知的对象）
``` 
id myType;//声明了一个指针，它的类型为id
```

* static typing
```
NSString *s = @"x";     //"statically" typed, 是合法的
id obj = s;             //不是static type,但也是合法的
Array *a = obj;         //虽然是合法的，但是非常不安全（让一个array指针指向字符串）
```

* 向一个id类型的对象发送它未知的消息，程序就会crash
   * 解决方案1： 用上面讲的static typing，让编译器来判断是否是未知消息
   * 解决方案2： 发送消息前，先检查id的实际类型和消息（introspection）


**内省（Introspection）**
* NSObject（继承自NSObject的对象都有以下方法）
   * iskindOfClass      包括继承
   * isMemberOfClass    不包括继承
   * respondsToSelector 是否认识某种方法

 p26











