# iBeacon
This XCode project provides you sample code for receiving iBeacon and posting it.

## Environment
 - iOS 9.2 (iPhone 6)
 - XCode 7.2
 - MaxOS X 10.11.2 (MacBook Pro)

## Advertiser
We need iBeacon advertiser to test this sample code. I recommend you to use npm module [bleacon](https://www.npmjs.com/package/bleacon). It is easy and fast to advertise! Only 5 lines :D

```javascript
var bleacon = require('bleacon');
var uuid = '704ae405-8122-40d7-a543-249b563b770e';
var major = 123;
var minor = 456;
bleacon.startAdvertising(uuid, major, minor);
```

## Dependencies
This project uses Cocoapods.
 - Alamofire
 - SwiftyJSON


```text
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'iBeacon' do
  pod 'Alamofire', '~> 3.0'
  pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'
end
```

## Assumptions
We will post `iBeacon Data` to `https://www.example.com/beacons`.

```json
{
  "beacons" : [
    {
      "minor" : 456,
      "rssi" : -42,
      "major" : 123,
      "region" : "704AE405-8122-40D7-A543-249B563B770E",
      "proximity" : 1
    },
    {
      "minor" : 789,
      "rssi" : -60,
      "major" : 234,
      "region" : "704AE405-8122-40D7-A543-249B563B770E",
      "proximity" : 2
    },
    {
      "minor" : 4678,
      "rssi" : -55,
      "major" : 897,
      "region" : "704AE405-8122-40D7-A543-249B563B770E",
      "proximity" : 2
    }
  ]
}
```
