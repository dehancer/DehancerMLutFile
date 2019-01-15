//
//  MLutRevisionModel.m
//  CryptoSwift
//
//  Created by denn on 15/01/2019.
//

#import "MLutRevisionModel.h"

@implementation MLutRevisionModel
- (instancetype) initWithInteger:(NSInteger)value {
    self = [super init];
    if (self) {
        self.nsvalue = [NSNumber numberWithInteger:value];
    }
    return self;
}

+ (NSString*) name {
    return  @"mlutRevision";
}
@end
