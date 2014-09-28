//
//  ViewController.m
//  Mapp
//
//  Created by John A Torres B on 27/09/14.
//  Copyright (c) 2014 hangover. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *notMatchButton;
@property (weak, nonatomic) IBOutlet UIButton *matchButton;
@property (weak, nonatomic) IBOutlet UIView *matchContainer;
@property (weak, nonatomic) IBOutlet CSAnimationView *matchAnimationView;

@property (weak, nonatomic) IBOutlet CSAnimationView *notMatchAnimationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)matchAction:(id)sender {
    [self.matchAnimationView startCanvasAnimation];
 
}
- (IBAction)notMatchAction:(id)sender {
    [self.notMatchAnimationView startCanvasAnimation];
}


@end
