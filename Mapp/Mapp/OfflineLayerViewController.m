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

@implementation OfflineLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    RMMapboxSource *onlineSource = [[RMMapboxSource alloc] initWithMapID:kMapboxMapID];
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:onlineSource];
    
    mapView.zoom = 16;
    
    mapView.centerCoordinate = CLLocationCoordinate2DMake(5.0489445833730136, -75.48287893717622);
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:mapView];

    

    for (VenueModel *venue in self.places) {
        RMPointAnnotation *annotation = [[RMPointAnnotation alloc] initWithMapView:mapView coordinate:CLLocationCoordinate2DMake(venue.lat, venue.lng) andTitle:venue.name];
    }
}

@end