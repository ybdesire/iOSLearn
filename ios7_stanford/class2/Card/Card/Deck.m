//
//  Deck.m
//  Card
//
//  Created by biny on 2/16/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import "Deck.h"

// Deck类私有属性/方法
@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;//存储这副牌的所有扑克牌

@end


// Deck类实现
@implementation Deck

//cards 的 getter
- (NSMutableArray *)cards
{
    if(_cards==nil)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop)
    {
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];//调用自己写的addCard atTop
}

- (Card*)drawRandomCard
{
    return nil;
}

@end