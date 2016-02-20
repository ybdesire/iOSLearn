//
//  PlayingCardDeck.m
//  Card
//
//  Created by biny on 2/16/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype) init//在这里创建52张牌
{
    self = [super init];
    if (self) {
        for(NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger rank=1; rank<=[PlayingCard maxRank]; rank++) {
                
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }

    }
    
    return self;
}

@end







