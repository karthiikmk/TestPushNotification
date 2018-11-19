//
//  File.swift
//  TestPushNotification
//
//  Created by Karthik on 11/20/18.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct NotificationData {
    var title: String = ""
    var body: String = ""
    public var icon: String = "ic_launcher"
    var sound: String = ""
    var clickAction: String = ""
    var mutableContent: Bool = false
    var contentAvailable: Bool = false
    
    public init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    public init(title: String, body: String, sound: String, clickAction: String) {
        self.init(title: title, body: body)
        self.sound = sound
        self.clickAction = clickAction
    }
    
    public init(title: String, body: String, sound: String, clickAction: String, mutableContent: Bool, contentAvailable: Bool) {
        self.init(title: title, body: body, sound: sound, clickAction: clickAction)
        self.mutableContent = mutableContent
        self.contentAvailable = contentAvailable
    }
    
    func toDict()  -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["title"] = self.title
        dict["body"] = self.body
        dict["icon"] = self.icon
        dict["sound"] = self.sound
        dict["clickAction"] = self.clickAction
        dict["mutable_content"] = self.mutableContent
        dict["content_available"] = self.contentAvailable
        return dict
    }
}

public struct PushNotificationData {
    let authKey: String
    let fcmToken: [String]
    let data: NotificationData
    
    public init(authKey: String, fcmToken: [String], notificationData: NotificationData) {
        self.authKey = authKey
        self.fcmToken = fcmToken
        self.data = notificationData
    }
    
    func getNotificationPayload() -> [String: Any] {
        var payload: [String: Any] = [:]
        payload["priority"] = "high"
        payload.add(key: "data", value: [:])
        payload.add(key: "registration_ids", value: self.fcmToken)
        payload.add(key: "notification", value: self.data.toDict())
        return payload
    }
}

open class TestPushManager {
    
    private let logTag = "[TestPushManager]:"
    private let pushData: PushNotificationData
    
    public init(pushData: PushNotificationData) {
        self.pushData = pushData
    }
    
    public typealias FireCompeletion = (_ success: Bool, _ json: JSON, _ error: Error?) -> Void
    
    public func fire(completion: FireCompeletion? = nil) {
        
        guard let url = URL(string: "https://fcm.googleapis.com/fcm/send") else {
            completion?(false, JSON.null, nil)
            return
        }
        
        let parameters: [String: Any] = self.pushData.getNotificationPayload()
        print("json: \(JSON(parameters))")
        
        let headers: HTTPHeaders = [
            "Authorization": "key=\(pushData.authKey)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { (response) in
                logMessage("fire status code: \(String(describing: response.response?.statusCode))")
                guard response.result.isSuccess, let resp = response.result.value else {
                    completion?(false, JSON.null, response.result.error)
                    return
                }
                let json = JSON(resp)
                completion?(true, json, nil)
        }

        //create the URLRequest object using the url object
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        do { // pass dictionary to nsdata object and set it as request body
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
//        } catch let error {
//            logError(error)
//        }
//
//
//
//        request.addValue("Authorization", forHTTPHeaderField: "key=\(pushData.authKey)")
//        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        //["Content-Type": "application/json"]
//
//
//        //create dataTask using the session object to send data to the server
//        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//
//            if let err = error {
//                logError(err)
//                return
//            }
//
//            guard let data = data else {
//                logError("\(self.logTag) Received Invalid data")
//                return
//            }
//
//            do {
//                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                    print(json)
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        })
//        task.resume()
    }
}


// MARK: Loggers
public func logMessage(_ string: String) {
    //guard AwBusinessLine.shared.enableLog else { return }
    print(string)
}

public func logWarning(_ string: String) {
    ///guard AwBusinessLine.shared.enableLog else { return }
    print("\(string) ⚠️")
}

public func logError(_ error: Error) {
    //guard AwBusinessLine.shared.enableLog else { return }
    //    guard let err = error as? BusinessLineError else {
    //        print("ERROR: \(error.localizedDescription)")
    //        return
    //    }
    print("❌ \(error.localizedDescription)")
}

public func logError(_ string: String) {
    //guard AwBusinessLine.shared.enableLog else { return }
    print("❌ \(string)")
}
