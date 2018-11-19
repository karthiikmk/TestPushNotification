//
//  File.swift
//  Pods-TestPushNotification_Example
//
//  Created by Karthik on 11/19/18.
//

import Foundation


extension Dictionary {
    
//    public var toJson: JSON {
//        return JSON(self)
//    }
    
    var hasData: Bool {
        return !self.isEmpty
    }
    
    mutating func add(key: Key, value: Value?) {
        if let value = value {
            self[key] = value
        }
    }
    
    mutating func addAll(other: Dictionary) {
        for (key, value) in other {
            self[key] = value
        }
    }
    
    mutating func addAll(fromDict: Dictionary?) {
        if let dict = fromDict {
            addAll(other: dict)
        }
    }
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
}
