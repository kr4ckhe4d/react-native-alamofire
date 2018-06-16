//
//  SwiftCalendarManager.swift
//  TestProject
//
//  Created by Nipuna H Herath on 6/15/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit
import Alamofire

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
  
  @objc func alamofireRequest(_ url: String, callback: @escaping (RCTResponseSenderBlock) ) -> Void {

    Alamofire.request("https://jsonplaceholder.typicode.com/posts", method: .get).responseJSON { response in
      print("Request: \(String(describing: response.request))")   // original url request
      print("Response: \(String(describing: response.response))") // http url response
      print("Result: \(response)")                         // response serialization result
      
//      if let json = response.result.value {
//        print("JSON: \(json)") // serialized json response
        callback( [[response.result.value]])
//      }
      
//      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//        print("Data: \(utf8Text)") // original server data as UTF8 string
//      }
    }
  }
  
}
