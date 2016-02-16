//
//  PlayingCard.h
//  Card
//
//  Created by biny on 2/16/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface PlayingCard : Card


@property (strong, nonatomic) NSString *suit;//花色： 红心(hearts)，方片(diamonds)，梅花(clubs)，黑桃（spade）

@property (nonatomic) NSUInteger rank;//牌大小：2，3，4...10(K)，11(Q)，12(J)，13(A)

+ (NSArray*)validSuits;

+ (NSUInteger) maxRank;
@end
