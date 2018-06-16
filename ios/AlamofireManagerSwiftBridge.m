//
//  AlamofireManagerSwiftBridge.m
//  ReactNativeAlamofire
//
//  Created by Nipuna H Herath on 6/16/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(AlamofireManagerSwift, NSObject)

RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)date callback: (RCTResponseSenderBlock)callback);
RCT_EXTERN_METHOD(alamofireRequest:(NSString *)url callback: (RCTResponseSenderBlock)callback);

@end
