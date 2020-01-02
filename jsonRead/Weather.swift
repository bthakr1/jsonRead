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
    
    init(json:[String:Any]) {
        
    }
    
    
    
}
