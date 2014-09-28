//
//  ViewController.m
//  Mapp
//
//  Created by John A Torres B on 27/09/14.
//  Copyright (c) 2014 hangover. All rights reserved.
//

#import "ViewController.h"
#import "VenuesModel.h"
#import "VenueModel.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *notMatchButton;
@property (weak, nonatomic) IBOutlet UIButton *matchButton;
@property (weak, nonatomic) IBOutlet UIView *matchContainer;
@property (weak, nonatomic) IBOutlet CSAnimationView *matchAnimationView;
@property (weak, nonatomic) IBOutlet CSAnimationView *notMatchAnimationView;
@property (strong, nonatomic) VenuesModel * model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"venues" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    self.model = [[VenuesModel alloc] initWithData:data error:&error];
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
        for (int i = 0; i<self.model.venues.count; i++) {
            VenueModel * venue = (VenueModel*) self.model.venues[i];
            [self createSwipeViewWithImageURL:venue.img [0]];
        }
    }

   

    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void) createSwipeViewWithImageURL:(NSString*)imageURL{
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.matchContainer.frame
                                                                   options:options];
    CGRect photoFrame =  CGRectMake(0, 0, self.matchContainer.frame.size.width, self.matchContainer.frame.size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:photoFrame];
    view.clipsToBounds = YES;
    
    [view addSubview:imageView];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    view.backgroundColor =[UIColor colorWithRed:0.95f green:0.95f blue:1.95f alpha:1.0f];
    [view sendSubviewToBack:imageView];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
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
