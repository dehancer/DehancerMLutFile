//
//  MLutAttributesModel.m
//  CryptoSwift
//
//  Created by denn on 16/01/2019.
//

#import "MLutAttributesModel.h"

@implementation MLutAttributesModel

@dynamic serial;
@dynamic datetime;

+ (NSString*) name {
    return  @"mlutAttributes";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _nsrevision = @(0);
        _nstimestamp = [NSDate new];       
        _nsid = @("");
        _nsisPhotoEnabled = false;
        _nsisVideoEnabled = false;
        
    }
    return self;
}



@end
