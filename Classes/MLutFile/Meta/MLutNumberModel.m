//
//  MLutNumberModel.m
//  CryptoSwift
//
//  Created by denn on 15/01/2019.
//

#import "MLutNumberModel.h"

@implementation MLutNumberModel
@dynamic serial;
@dynamic datetime;

- (instancetype) init {
    self = [super init];
    if (self) {
        _nsvalue = nil;
    }
    return self;
}

- (instancetype) initWithNumber:(NSNumber*)value {
    self = [super init];
    if (self) {
        _nsvalue = value;
    }
    return self;
}

-(nullable instancetype) initWithMeta:(ImageMeta*)meta error:(NSError *__autoreleasing *)error {
    self = [super init];
    if (self) {
        MLutNumberModel *f = [meta getField:[self class] fieldId:nil error:error];
        if (f == nil ){
            return nil;
        }
        _nsvalue = f.nsvalue;
    }
    return self;
}


@end
