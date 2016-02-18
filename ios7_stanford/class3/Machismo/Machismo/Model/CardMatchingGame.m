//
//  CardMatchingGame.m
//  Machismo
//
//  Created by biny on 2/18/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;//将公有的readonly声明为私有中的readwrite，即通过对象来访问属性时-readonly，但在类内访问-readwrite

@property (nonatomic,strong) NSMutableArray *cards;

@end



@implementation CardMatchingGame

//惰性实例化，利用cards的setter对cards初始化
//在setter中初始化property，能让initializer更简洁
- (NSMutableArray*)cards
{
    if (_cards==nil) {
        return [[NSMutableArray alloc] init];
    }
    return _cards;
}


- (instancetype)initWithCardCount:(NSInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card*)cardAtIndex:(NSInteger)index
{
    return (index<[self.cards count])?self.cards[index]:nil;
}

static const int MISMATCH_PENALTY=2;
static const int  MATCH_BONUS=4;
static const int  COST_TO_CHOOSE=1;

- (void)chooseCardAtIndex:(NSInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }
        else
        {
            for (Card *otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }
                    else
                    {
                        otherCard.chosen = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
                
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
