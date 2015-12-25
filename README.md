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
