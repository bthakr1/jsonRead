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
    
    // This is the base path with API Key
    
    static let basePath = "https://api.darksky.net/forecast/d8ded2e5186e84d14466e2d34dff08c7/"
    
    static func forecast(withLocation location: String, completion: @escaping ([Weather]) -> ()) {
        let url = basePath + location
        
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response:URLResponse?, error : Error?) in
            
            var forecastArray : [Weather] = []
            
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let dailyForecast = json["daily"] as? [String:Any]{
                            if let dailyData = dailyForecast["data"] as? [[String:Any]]{
                                for dataPoint in dailyData {
                                    if let weatherObject = try? Weather(json: dataPoint){
                                        forecastArray.append(weatherObject)
                                    }
                                }
                            }
                        }
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        task.resume()
        
    }
    
    
    }


    

