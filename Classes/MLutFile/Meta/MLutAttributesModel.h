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
@property(nullable)  NSNumber *nsisPrinted;
@property(nullable)  NSNumber *nscolorType;
@property(nullable)  NSNumber *nsfilmType;
@property(nullable)  NSNumber *nsISOIndex;
@property(nullable)  NSNumber *nsexpandBlendingMode;
@property(nullable)  NSNumber *nsexpandImpact;

@property(nonnull)   NSString *nsid;
@property(nullable)  NSString *nscaption;
@property(nullable)  NSString *nsdescription;
@property(nullable)  NSString *nsauthor;
@property(nullable)  NSString *nsmaintainer;
@property(nullable)  NSString *nstags;

@property(nonnull)  NSNumber *nsisVideoEnabled;
@property(nonnull)  NSNumber *nsisPhotoEnabled;


@end

NS_ASSUME_NONNULL_END
