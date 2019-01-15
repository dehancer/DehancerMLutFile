//
//  MLutRevisionModel.h
//  CryptoSwift
//
//  Created by denn on 15/01/2019.
//

#import <IMProcessingXMP/ImageMeta.h>
#import "MLutNumberModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLutRevisionModel : MLutNumberModel
@property(nonnull)  NSNumber *nsvalue;
-(instancetype) initWithInteger:(NSInteger)value;
@end

NS_ASSUME_NONNULL_END
