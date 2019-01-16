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

@property(nullable)  NSNumber *nsformatVersion;

@property(nullable)  NSNumber *nsrevision;

@property(nullable)  NSDate  *nstimestamp;

@property(nullable)  NSNumber *nslutType;
@property(nullable)  NSNumber *nslutSize;
@property(nullable)  NSNumber *nsisPublished;
@property(nullable)  NSNumber *nsisPrinted;
@property(nullable)  NSNumber *nscolorType;
@property(nullable)  NSNumber *nsfilmType;
@property(nullable)  NSNumber *nsexpandBlendingMode;
@property(nullable)  NSNumber *nsexpandImpact;

@property(nullable)  NSString *nsname;
@property(nullable)  NSString *nsdescription;
@property(nullable)  NSString *nsauthor;
@property(nullable)  NSString *nsmantainer;
@property(nullable)  NSString *nstags;

@end

NS_ASSUME_NONNULL_END