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
        let addr = "부산광역시 부산진구 양정동 429-19"
        let geocoder = CLGeocoder()
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
        
        
        
        // 후행 클로저 (trailing closure)
        // 일반함수처럼 사용하는 클로저, 마지막 인자가 클로저일 때 사용가능
        geocoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error: Error?) in
            
            if error != nil {
                print(error!)
            }
            // optional binding check
            if let myPlacemarks = placemarks {
                
                //첫번째 배열이 가지고 있음
                let myPlacemark = myPlacemarks.first
                print(myPlacemark?.country)
                print(myPlacemark?.location?.coordinate.latitude)
                
                // 핀 꼽기
                let pin = MKPointAnnotation()
                pin.coordinate = (myPlacemark?.location!.coordinate)!
                pin.title = "동의과학대학교"
                pin.subtitle = "우리들의 꿈이 자라는 곳!"
                pins.append(pin)
                self.mapView.showAnnotations(pins, animated: true)
                
            }else {
                print("nil 발생")
            }
        }
    }


}

