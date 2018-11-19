# TestPushNotification

[![CI Status](https://img.shields.io/travis/karthikAdaptavant/TestPushNotification.svg?style=flat)](https://travis-ci.org/karthikAdaptavant/TestPushNotification)
[![Version](https://img.shields.io/cocoapods/v/TestPushNotification.svg?style=flat)](https://cocoapods.org/pods/TestPushNotification)
[![License](https://img.shields.io/cocoapods/l/TestPushNotification.svg?style=flat)](https://cocoapods.org/pods/TestPushNotification)
[![Platform](https://img.shields.io/cocoapods/p/TestPushNotification.svg?style=flat)](https://cocoapods.org/pods/TestPushNotification)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TestPushNotification is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TestPushNotification'
```

## Usage 
```swift
        let authKey = "{your auth key goes here}"
         
        let fcmKey = ["c7igErTWSB0:APA91bFoYmSqQa-v-xZkpWRYvXWEfvE79fme4jVAQTTyhHjdFi6_Q9tP3uskevnnB2_5_WTeLkrCZyok2F_JFR3b2NgAoyEVCgwVWAgFcPZoRTZR5neaibqaTTgad4AyeOnew5sGEyHf"]
        
        let data = NotificationData(title: "Karthik", body: "Hi, there this is test")
        
        let pushData = PushNotificationData(authKey: authKey, fcmToken: fcmKey, notificationData: data)
        
        let testPush = TestPushManager(pushData: pushData)
        
        testPush.fire()
```
## Author

karthikAdaptavant, karthik.samy@a-cti.com

## License

TestPushNotification is available under the MIT license. See the LICENSE file for more info.
