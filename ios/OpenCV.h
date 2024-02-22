#ifndef OpenCV_h
#define OpenCV_h

#import <opencv2/opencv.hpp>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIImage.h>
#import <CoreMedia/CMSampleBuffer.h>
#import <React/RCTBridge+Private.h>
#import <React/RCTUtils.h>
#import <ReactCommon/RCTTurboModule.h>
#import <jsi/jsi.h>

@interface OpenCV: NSObject
  + (NSString *) getOpenCVVersion;
  + (UIImage *) toUIImage:(CMSampleBufferRef)samImageBuff;
  + (NSDictionary *) findObjects:(UIImage *)image;
@end

//void install_opencv(facebook::jsi::Runtime &rt);

#endif /* OpenCV_h */
