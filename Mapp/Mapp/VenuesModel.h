//
//  VenuesModel.h
//  Mapp
//
//  Created by John A Torres B on 28/09/14.
//  Copyright (c) 2014 hangover. All rights reserved.
//

#import "JSONModel.h"
#import "VenueModel.h"

@interface VenuesModel : JSONModel
@property (strong, nonatomic) NSArray<VenueModel>* venues;

@end
