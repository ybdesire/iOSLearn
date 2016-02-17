//
//  ViewController.m
//  Machismo
//
//  Created by biny on 2/16/16.
//  Copyright © 2016 biny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation ViewController

//在flipCount的setter里，将计数值显示到Label
- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
    NSLog(@"flips = %d", self.flipCount);
}

//单击button时，调用这个函数
- (IBAction)touchCardButton:(UIButton *)sender {

    if ([sender.currentTitle length]!=0) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    
    self.flipCount++;
    

}

@end
