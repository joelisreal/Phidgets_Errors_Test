//
//  ViewController.swift
//  Phidgets_Errors_Test
//
//  Created by Joel Igberase on 2019-04-18.
//  Copyright © 2019 Joel Igberase. All rights reserved.
//

import UIKit
import Phidget22Swift

class ViewController: UIViewController {

    let led = DigitalOutput()
    
    func error_handler(sender: Phidget, data: (code: ErrorEventCode, description: String)) {
        print("Phidget Error Event: " + data.description)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do{
            //address object - Error will be generated from this line of code
            try led.setHubPort(8)
            
            let _ = led.error.addHandler(error_handler)
            
        } catch let err as PhidgetError{
            print("Phidget Error " + err.description)
        } catch{
            //catch other errors here
        }
    }
}

