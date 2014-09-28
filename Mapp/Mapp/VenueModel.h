//
//  VenueModel.h
//  Mapp
//
//  Created by John A Torres B on 28/09/14.
//  Copyright (c) 2014 hangover. All rights reserved.
//

#import "JSONModel.h"

@protocol VenueModel
@end

@interface VenueModel : JSONModel
@property (assign, nonatomic) int id;
@property (assign, nonatomic) float lat;
@property (assign, nonatomic) float lng;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSArray* img;

@end
