//
//  MLutBool.h
//  ExportPanel
//
//  Created by denn on 11.07.2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

#import <IMProcessingXMP/ImageMeta.h>
#import "MLutNumberModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLutBoolModel : MLutNumberModel
@property(nonnull)  NSNumber *nsvalue;
- (instancetype) initWithBoolean:(BOOL)value;
@end

@interface MLutPublish : MLutBoolModel
@property(nonnull)  NSNumber *nsvalue;
@end

@interface MLutPrinted : MLutBoolModel
@property(nonnull)  NSNumber *nsvalue;
@end


NS_ASSUME_NONNULL_END
