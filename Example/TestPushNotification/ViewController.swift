//
//  ViewController.swift
//  TestPushNotification
//
//  Created by karthikAdaptavant on 11/19/2018.
//  Copyright (c) 2018 karthikAdaptavant. All rights reserved.
//

import UIKit
import TestPushNotification

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fireBtnAct(_ sender: Any) {
            
        let authKey = "{your auth key goes here}"
        let fcmKey = ["c7igErTWSB0:APA91bFoYmSqQa-v-xZkpWRYvXWEfvE79fme4jVAQTTyhHjdFi6_Q9tP3uskevnnB2_5_WTeLkrCZyok2F_JFR3b2NgAoyEVCgwVWAgFcPZoRTZR5neaibqaTTgad4AyeOnew5sGEyHf"]
        let data = NotificationData(title: "Karthik", body: "Hi, there this is test")
        let pushData = PushNotificationData(authKey: authKey, fcmToken: fcmKey, notificationData: data)
        let testPush = TestPushManager(pushData: pushData)
        testPush.fire()
    }
    
}

