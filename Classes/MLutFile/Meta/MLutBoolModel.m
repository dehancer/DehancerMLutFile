//
//  MLutBool.m
//  ExportPanel
//
//  Created by denn on 11.07.2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

#import "MLutBoolModel.h"

@implementation MLutBoolModel

- (instancetype) initWithBoolean:(BOOL)state {
    self = [super init];
    if (self) {
        self.nsvalue = [NSNumber numberWithBool:state];
    }
    return self;
}

@end

@implementation MLutPublish
+ (NSString*) name {
    return  @"mlutPublish";
}
@end

@implementation MLutPrinted
+ (NSString*) name {
    return  @"mlutPrinted";
}
@end
