//
//  Weather.swift
//  jsonRead
//
//  Created by Bhupendrasinh Thakre on 1/1/20.
//  Copyright © 2020 Bhupendrasinh Thakre. All rights reserved.
//

import Foundation

struct Weather {
    
    // convert data from json to object we can use
    
    // data model we are going to use
    // these are the key pairs
    
    let summary : String
    let icon : String
    let temprature : Double
    
    // for serialization error protocol
    // if while reading we get any error
    
    enum SerializationError : Error {
        case missing(String)
        case invalid(String, Any)
        
    }
    
    init(json:[String:Any]) throws  {
        // for first json objec we are reading from the json
        guard let summary = json["summary"] as? String else { throw SerializationError.missing("Summary is not available")}
        // for icon field
        guard let icon = json["icon"] as? String else { throw SerializationError.missing("icon is missing")}
        // for temprature
        guard let temprature = json["temperatureMax"] as? Double else {throw SerializationError.missing("Temp is missing")}
            
        // initalize the objects
        // important to do this 
        self.summary = summary
        self.icon = icon
        self.temprature = temprature
        }
    }
    
    
    
}
