//
//  SwiftCalendarManager.swift
//  TestProject
//
//  Created by Nipuna H Herath on 6/15/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit

@objc(SwiftCalendarManager)
class SwiftCalendarManager: NSObject {

  @objc func addEvent(_ name: String, location: String, date: NSNumber, callback: (RCTResponseSenderBlock) ) -> Void {
    // Date is ready to use!
    NSLog("%@ %@ %@", name, location, date)
    callback( [[
      "name": name,
      "location": location,
      "date" : date
      ]])
  }
  
}
