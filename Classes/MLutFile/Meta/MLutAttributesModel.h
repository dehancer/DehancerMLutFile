//
//  MLutAttributesModel.h
//  CryptoSwift
//
//  Created by denn on 16/01/2019.
//

#import <IMProcessingXMP/ImageMeta.h>
#import "MLutNumberModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLutAttributesModel : ImageMetaField

@property(nonnull)  NSNumber *nsformatVersion;

@property(nonnull)  NSNumber *nsrevision;

@property(nonnull)  NSNumber *nslutType;
@property(nonnull)  NSNumber *nslutSize;
@property(nonnull)  NSNumber *nsisPublished;
@property(nonnull)  NSNumber *nsisPrinted;
@property(nonnull)  NSNumber *nscolorType;
@property(nonnull)  NSNumber *nsfilmType;
@property(nonnull)  NSNumber *nsexpandBlendingMode;
@property(nonnull)  NSNumber *nsexpandImpact;

@property(nullable)  NSString *nsname;
@property(nullable)  NSString *nsdescription;
@property(nullable)  NSString *nsauthor;
@property(nullable)  NSString *nsmantainer;
@property(nullable)  NSString *nstags;

@end

NS_ASSUME_NONNULL_END
