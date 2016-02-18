//
//  Deck.h
//  Card
//
//  Created by biny on 2/16/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

// 向一副牌中添加一张牌
- (void)addCard:(Card*)card atTop:(BOOL)atTop;
- (void)addCard:(Card*)card;

// 随机从一副牌中抽一张牌
- (Card*)drawRandomCard;

@end