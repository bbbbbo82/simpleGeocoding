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
        
        var pins = [MKPointAnnotation]()
        //let addr = "부산광역시 부산진구 양정동 429-19"
        
        let lat = 35.1658704
        let lng = 129.0728461
        let loc = CLLocation(latitude: lat, longitude: lng)
        
        let geocoder = CLGeocoder()
        
        // 후행 클로저 (trailing closure)
        geocoder.reverseGeocodeLocation(loc) {
            (placemarks: [CLPlacemark]?, error: Error?) in
            if error != nil {
                print(error!)
                
            }
            // optional binding check
            if let myPlacemarks = placemarks {
                //첫번째 배열이 가지고 있음
                let myPlacemark = myPlacemarks[0]
                print(myPlacemark.country)
                print(myPlacemark.location)
                
                // 핀 꼽기
                let pin = MKPointAnnotation()
                pin.coordinate = (myPlacemark.location!.coordinate)
                pin.title = "동의과학대학교"
                pin.subtitle = "우리들의 꿈이 자라는 곳!"
                pins.append(pin)
                self.mapView.showAnnotations(pins, animated: true)
                
            }else {
                print("nil 발생")
            }
        }
    

//        // 인자에 함수가 변수처럼 들어감 (클로저)
//        geocoder.geocodeAddressString(addr, completionHandler: {
//            (placemarks: [CLPlacemark]?, error: Error?) in
//
//            if error != nil {
//                print(error!)
//            }
//            // optional binding check
//            if let myPlacemarks = placemarks {
//
//                //첫번째 배열이 가지고 있음
//                let myPlacemark = myPlacemarks.first
//                print(myPlacemark?.country)
//                print(myPlacemark?.location?.coordinate.latitude)
//
//                // 핀 꼽기
//                let pin = MKPointAnnotation()
//                pin.coordinate = (myPlacemark?.location!.coordinate)!
//                pin.title = "동의과학대학교"
//                pin.subtitle = "우리들의 꿈이 자라는 곳!"
//                pins.append(pin)
//                self.mapView.showAnnotations(pins, animated: true)
//
//            }else {
//                print("nil 발생")
//            }
//        })
        
        
        
 
    }
}

