//
//  CardMatchingGame.h
//  Machismo
//
//  Created by biny on 2/18/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSInteger)index;

- (Card*)cardAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
