//
//  ViewController.swift
//  jsonRead
//
//  Created by Bhupendrasinh Thakre on 1/1/20.
//  Copyright © 2020 Bhupendrasinh Thakre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Weather.forecast(withLocation: "37.8267,-122.4233") { (results:[Weather]) in
            for result in results {
                print("\(result)\n\n")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

