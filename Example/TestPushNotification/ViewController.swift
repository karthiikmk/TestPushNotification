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
        let fcmKey = ["list of fcm tokens"]
        let data = NotificationData(title: "Karthik", body: "Hi, there this is test")
        let pushData = PushNotificationData(authKey: authKey, fcmToken: fcmKey, notificationData: data)
        let testPush = TestPushManager(pushData: pushData)
        testPush.fire()
    }
    
}

