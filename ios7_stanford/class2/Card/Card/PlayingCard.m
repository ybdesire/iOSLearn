//
//  PlayingCard.m
//  Card
//
//  Created by biny on 2/16/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


//重写父类中property contents的getter
- (NSString*) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];//返回format过的字符串(rank-牌大小, suit-花色)
}

@synthesize suit = _suit;//如果重写了setter和getter，编译器就不会强制声明synthesize，所以这里必须手动声明
//为suit写getter
- (NSString*)suit
{
    return _suit ? _suit : @"?";//suit初始为nil，此时返回问号；否则返回正常花色
}


//suit setter
- (void)setSuit:(NSString*)suit//确保设置的花色只能是给定这几个（红心，方片，梅花，黑桃）
{
    if([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

+ (NSArray*)validSuits//静态方法
{
    return @[@"h", @"d", @"c", @"s"];
}

+ (NSArray*)rankStrings//静态方法, 注意其调用方式[类名 方法名]
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank//rankStrings中，有多少个字符串
{
    return [[self rankStrings] count]-1;
}

//重写rank的setter，保证rank不会被设置错误的数值，比如15
- (void)setRank:(NSUInteger)rank
{
    if(rank<=[PlayingCard maxRank])
    {
        _rank = rank;
    } 
}


@end
