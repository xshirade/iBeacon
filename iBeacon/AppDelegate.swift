//
//  AppDelegate.swift
//  iBeacon
//
//  Created by Satoshi Hirade on 12/25/15.
//  Copyright © 2015 Satoshi Hirade. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?

    let manager: CLLocationManager = CLLocationManager()
    let region: CLBeaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "704ae405-8122-40d7-a543-249b563b770e")!, identifier: "com.example.www")
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        manager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        if status != CLAuthorizationStatus.AuthorizedAlways {
            manager.requestAlwaysAuthorization()
        }
        return true
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case CLAuthorizationStatus.AuthorizedAlways:
            print("didChangeAuthorizationStatus: startMonitoringForRegion")
            manager.startMonitoringForRegion(self.region)
        default:
            print("didChangeAuthorizationStatus: stopMonitoringForRegion")
            manager.stopMonitoringForRegion(self.region)
        }
    }
    
    func locationManager(manager: CLLocationManager, didDetermineState state: CLRegionState, forRegion region: CLRegion) {
        switch state {
        case CLRegionState.Inside:
            print("didDetermineState: startRangingBeaconsInRegion")
            manager.startRangingBeaconsInRegion(self.region)
        case CLRegionState.Outside, CLRegionState.Unknown:
            print("didDetermineState: stopRangingBeaconsInRegion")
            manager.stopRangingBeaconsInRegion(self.region)
        }
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        // implement whatever you wanna do
        print(beacons)
    }

}

