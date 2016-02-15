//
//  Card.m
//  Card
//
//  Created by biny on 2/15/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import "Card.h"

//OC并不要求你在使用之前一定要声明
//所以可以在.m中创建私有方法

@interface Card()

- (void)private_func;

@end



@implementation Card
//实现私有方法
- (void) private_func
{
    
}

//public
-(int)match:(NSArray*)otherCards
{
    int score=0;
    for (Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]){//发送消息有两种方法：方括号、点号；
            score=1;
        }//这里比较没有用==，应为==只比较指针本身，而这里要比较内容
    }
    
    
    return score;
}
@end
