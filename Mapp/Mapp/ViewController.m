//
//  ViewController.m
//  Mapp
//
//  Created by John A Torres B on 27/09/14.
//  Copyright (c) 2014 hangover. All rights reserved.
//

#import "ViewController.h"
#import "VenuesModel.h"


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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"venues" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    VenuesModel *model = [[VenuesModel alloc] initWithData:data error:&error];
    if (error) {
        
    } else {
        // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
        options = [MDCSwipeToChooseViewOptions new];
        options.delegate = self;
        options.likedText = @"Go";
        options.likedColor = [UIColor greenColor];
        options.nopeText = @"No";
        options.onPan = ^(MDCPanState *state){
            NSLog(@"%f",state.thresholdRatio);
            if (state.thresholdRatio >1.3f && state.direction == MDCSwipeDirectionLeft) {
                NSLog(@"Let go now to delete the photo!");
                
                
            }
        };
        for (int i = 0; i<model.venues.count; i++) {
            [self createSwipeView];
        }
    }

   

    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void) createSwipeView {
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.matchContainer.frame
                                                                     options:options];
    view.backgroundColor =[UIColor blueColor];
    // view.imageView.image = [UIImage imageNamed:@"photo"];
   [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)matchAction:(id)sender {
    [self.matchAnimationView startCanvasAnimation];
 
    //self.notMatchAnimationView.
 
}
- (IBAction)notMatchAction:(id)sender {
    [self.notMatchAnimationView startCanvasAnimation];
}


@end
