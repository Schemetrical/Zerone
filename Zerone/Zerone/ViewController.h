//
//  ViewController.h
//  Zerone
//
//  Created by Yichen Cao on 4/29/14.
//  Copyright (c) 2014 Schem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *label0;
@property (weak, nonatomic) IBOutlet UIButton *label1;

- (IBAction)numberButtons:(id)sender;

@end
