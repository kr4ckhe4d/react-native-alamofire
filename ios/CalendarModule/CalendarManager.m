//
//  CalendarManager.m
//  TestProject
//
//  Created by Nipuna H Herath on 6/14/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "CalendarManager.h"
#import <React/RCTLog.h>

@implementation CalendarManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
  NSLog(@"Name: %@", name);
  NSLog(@"Location: %@", location);
}

@end
