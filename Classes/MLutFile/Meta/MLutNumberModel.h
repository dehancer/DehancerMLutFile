//
//  MLutNumberModel.h
//  CryptoSwift
//
//  Created by denn on 15/01/2019.
//

#import <IMProcessingXMP/ImageMeta.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLutNumberModelProtocol
@property(nonnull)  NSNumber *nsvalue;
-(instancetype) initWithNumber:(NSNumber*)value;
-(nullable instancetype) initWithMeta:(ImageMeta*)meta error:(NSError *__autoreleasing *)error;
@end

@interface MLutNumberModel : ImageMetaField<MLutNumberModelProtocol>
@property(nonnull)  NSNumber *nsvalue;
@end

NS_ASSUME_NONNULL_END
