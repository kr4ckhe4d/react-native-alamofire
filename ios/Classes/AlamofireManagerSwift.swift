//
//  AlamofireManagerSwift.swift
//  ReactNativeAlamofire
//
//  Created by Nipuna H Herath on 6/16/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation
import Alamofire

@objc(AlamofireManagerSwift)
class AlamofireManagerSwift: RCTEventEmitter {
  
  override func supportedEvents() -> [String]! {
    return ["MyEvent"]
  }
  
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
    
//    Alamofire.request(url, method: .get).responseJSON { response in
//      print("Request: \(String(describing: response.request))")   // original url request
//      print("Response: \(String(describing: response.response))") // http url response
//      print("Result: \(response)")                         // response serialization result
//
//      //      if let json = response.result.value {
//      //        print("JSON: \(json)") // serialized json response
//      callback( [[response.result.value]])
//      //      }
//
//      //      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//      //        print("Data: \(utf8Text)") // original server data as UTF8 string
//      //      }
//    }
    Alamofire.download("https://upload.wikimedia.org/wikipedia/commons/c/cc/ESC_large_ISS022_ISS022-E-11387-edit_01.JPG")
      .downloadProgress { progress in
        let progressInInt = Int(progress.fractionCompleted*100)
        
        print("Download Progress: \(progressInInt)")
        self.sendEvent(withName: "MyEvent", body: progressInInt)
        if progressInInt == 100{
          callback( [["Done"]])
        }
      }
      .responseData { response in
        if let data = response.result.value {
          let image = UIImage(data: data)
        }
    }
  }
  
}
