//
//  OfflineLayerViewController.h
//  Mapbox Example
//
//  Copyright (c) 2014 Mapbox, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenuesModel.h"

@interface OfflineLayerViewController : UIViewController

@property (nonatomic,strong) VenuesModel *places;
- (IBAction)onBack:(id)sender;
@end