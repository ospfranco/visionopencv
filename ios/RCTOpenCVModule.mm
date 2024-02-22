//#import "RCTOpenCVModule.h"
//#import "OpenCV.h"
//#import <jsi/jsi.h>
//#import <React/RCTBridge+Private.h>
//#import <React/RCTUtils.h>
//#import <ReactCommon/RCTTurboModule.h>
//
//@implementation RCTOpenCVModule
//
//@synthesize bridge=_bridge;
//
//RCT_EXPORT_MODULE()
//
//- (void)setBridge:(RCTBridge *)bridge {
//  _bridge = bridge;
//}
//
//RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(install)
//{
//  RCTCxxBridge *cxxBridge = (RCTCxxBridge *)_bridge;
//  if (cxxBridge == nil) {
//      return @false;
//  }
//  
//  auto jsiRuntime = (facebook::jsi::Runtime *)cxxBridge.runtime;
//  if (jsiRuntime == nil) {
//      return @false;
//  }
//  auto &runtime = *jsiRuntime;
//  auto callInvoker = _bridge.jsCallInvoker;
//  
//  // Get appGroupID value from Info.plist using key "AppGroup"
//  NSString *appGroupID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"OPSQLite_AppGroup"];
//  NSString *documentPath;
//  
//  if (appGroupID != nil) {
//      // Get the app groups container storage url
//      NSFileManager *fileManager = [NSFileManager defaultManager];
//      NSURL *storeUrl = [fileManager containerURLForSecurityApplicationGroupIdentifier:appGroupID];
//      
//      if (storeUrl == nil) {
//          NSLog(@"OP-SQLite: Invalid AppGroup ID provided (%@). Check the value of \"AppGroup\" in your Info.plist file", appGroupID);
//          return @false;
//      }
//      
//      documentPath = [storeUrl path];
//  } else {
//      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, true);
//      documentPath = [paths objectAtIndex:0];
//  }
//  
//  install_opencv(runtime);
//}
//@end
