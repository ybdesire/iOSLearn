//
//  Card.h
//  Card
//
//  Created by biny on 2/15/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

//property声明
//property便于初始化变量（OC中所有属性都以0开始）
@property (strong, nonatomic) NSString *contents;//要在堆中申请内存，才需要strong；strong-引用计数； weak-指针为空时会被赋值为nil// nonatomic-不是线程安全（为了让代码简单，不需要lock这样的大段代码）
@property (nonatomic, getter=isChoosen) BOOL choose;//原始类型，不存储在堆中，就不需要strong; 可以重命名getter函数
@property (nonatomic, getter=isMatched) BOOL matched;


//public 方法
- (int)match:(NSArray*)otherCards;
@end
