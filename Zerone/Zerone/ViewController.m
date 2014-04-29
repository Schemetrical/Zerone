//
//  ViewController.m
//  Zerone
//
//  Created by Yichen Cao on 4/29/14.
//  Copyright (c) 2014 Schem. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) int score;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [[NSTimer alloc] init];
    }
    return _timer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self reset];
}

- (IBAction)numberButtons:(id)sender
{
    if ([[(UIButton *)sender titleLabel].text isEqualToString:self.numberLabel.text]) {
        [self clickedRightNumber];
        [self generateRandomNumber];
        [self startTimer];
    } else {
        [self clickedWrongNumber];
    }
}

- (void)generateRandomNumber
{
    int r = arc4random_uniform(2);
    self.numberLabel.text = [NSString stringWithFormat:@"%i",r];
}

- (void)clickedRightNumber
{
    self.score++;
}

- (void)clickedWrongNumber
{
    [self.timer invalidate];
    self.label0.enabled = NO;
    self.label1.enabled = NO;
    self.numberLabel.text = @"✕";
    [self performSelector:@selector(reset)
               withObject:nil
               afterDelay:2];
}

- (void)tooSlow
{
    [self.timer invalidate];
    self.label0.enabled = NO;
    self.label1.enabled = NO;
    self.numberLabel.text = @"Too Slow";
    [self performSelector:@selector(reset)
               withObject:nil
               afterDelay:2];
}

- (void)reset
{
    self.label0.enabled = YES;
    self.label1.enabled = YES;
    [self generateRandomNumber];
    self.score = 0;
}

- (void)setScore:(int)score
{
    _score = score;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",score];
}

- (void)startTimer
{
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 / self.score + 0.5
                                                  target:self
                                                selector:@selector(tooSlow)
                                                userInfo:nil
                                                 repeats:NO];
}

@end
