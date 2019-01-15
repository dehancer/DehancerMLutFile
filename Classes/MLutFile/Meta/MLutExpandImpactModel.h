//
//  MLutExpandImpact.h
//  Dehancer mLut Maker
//
//  Created by denn on 03/12/2018.
//  Copyright © 2018 Dehancer. All rights reserved.
//

#import <IMProcessingXMP/ImageMeta.h>
#import "MLutNumberModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLutExpandImpactModel : MLutNumberModel
@property(nonnull)  NSNumber *nsvalue;
-(instancetype) initWith:(float)value;
@end

NS_ASSUME_NONNULL_END
