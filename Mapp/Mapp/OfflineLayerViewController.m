//
//  OfflineLayerViewController.m
//  Mapbox Example
//
//  Copyright (c) 2014 Mapbox, Inc. All rights reserved.
//

#import "OfflineLayerViewController.h"

#import "Mapbox.h"
#import "VenueModel.h"

#import "AppDelegate.h"

#define kMapboxMapID @"examples.map-z2effxa8"

@interface OfflineLayerViewController ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navbar;

@end

@implementation OfflineLayerViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"logo.png"];
    UIImageView *titleView = [[UIImageView alloc] initWithImage:image ];
    
    titleView.bounds = CGRectMake(0, 0, 0, 35);
    titleView.contentMode = UIViewContentModeCenter;
    titleView.contentMode = UIViewContentModeScaleAspectFit;
    [self.navbar.topItem setTitleView:  titleView];
    
    RMMapboxSource *onlineSource = [[RMMapboxSource alloc] initWithMapID:kMapboxMapID];
    
    CGRect rect = CGRectMake(0, 20, 320, 620);
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:rect andTilesource:onlineSource];
    
    mapView.zoom = 14;
    
    mapView.centerCoordinate = CLLocationCoordinate2DMake(5.0489445833730136, -75.48287893717622);
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:mapView];
    [self.view sendSubviewToBack:mapView];

    for (VenueModel *venue in self.places.venues) {
        RMPointAnnotation *annotation = [[RMPointAnnotation alloc] initWithMapView:mapView coordinate:CLLocationCoordinate2DMake(venue.lat, venue.lng) andTitle:venue.name];
        [mapView addAnnotation:annotation];
    }
}

- (IBAction)onBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end