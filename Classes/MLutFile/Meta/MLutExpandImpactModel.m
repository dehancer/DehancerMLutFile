//
//  MLutExpandImpact.m
//  Dehancer mLut Maker
//
//  Created by denn on 03/12/2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

#import "MLutExpandImpactModel.h"

@implementation MLutExpandImpactModel

- (instancetype) initWith:(float)value {
    self = [super init];
    if (self) {
        self.nsvalue = [NSNumber numberWithFloat:value];
    }
    return self;
}

+ (NSString*) name {
    return  @"mlutExpandImpact";
}
@end
