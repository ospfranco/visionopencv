#import "OpenCV.h"
#import <VisionCamera/FrameProcessorPlugin.h>
#import <VisionCamera/FrameProcessorPluginRegistry.h>
#import <VisionCamera/Frame.h>

@interface ObjectDetectFrameProcessorPlugin : FrameProcessorPlugin
@end

@implementation ObjectDetectFrameProcessorPlugin

- (instancetype) initWithProxy:(VisionCameraProxyHolder*)proxy
                   withOptions:(NSDictionary* _Nullable)options {
  self = [super initWithProxy:proxy withOptions:options];
  return self;
}

- (id)callback:(Frame*)frame withArguments:(NSDictionary*)arguments {
  CMSampleBufferRef buffer = frame.buffer;
  UIImageOrientation orientation = frame.orientation;
  return [OpenCV findObjects:[OpenCV toUIImage:buffer]];
}

VISION_EXPORT_FRAME_PROCESSOR(ObjectDetectFrameProcessorPlugin, objectDetect)

@end
