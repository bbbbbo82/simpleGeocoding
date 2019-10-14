//
//  ViewController.swift
//  SimpleGeocoding02
//
//  Created by D7703_15 on 2019. 10. 14..
//  Copyright © 2019년 bohyun. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let addr = "부산광역시 부산진구 양정동 429-19"
        let geocoder = CLGeocoder()
        // 인자에 함수가 변수처럼 들어감 (클로저)
        geocoder.geocodeAddressString(addr, completionHandler: {
            (placemarks: [CLPlacemark]?, error: Error?) in
            
            if error != nil {
                print(error!)
            }
            // optional binding check
            if let myPlacemarks = placemarks {
                //배열의 첫번째에 넣음
                let myPlacemark = myPlacemarks.first
                print(myPlacemark?.country)
                print(myPlacemark?.location?.coordinate.latitude)
                
            }else {
                print("nil 발생")
            }
        })
    }


}

