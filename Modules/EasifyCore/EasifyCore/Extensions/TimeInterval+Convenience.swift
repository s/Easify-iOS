//
//  TimeInterval+Convenience.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public extension TimeInterval {
    /// `minuteSecondMS` is a convenience computed variable which converts a `TimeInterval` to `mm:ss:ms` format.
    var minuteSecondMS: String {
        return String(format: "%d:%02d.%03d", minute, second, millisecond)
    }
    
    /// `minute` is a convenience computed variable which converts a `TimeInterval` to minutes.
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    
    /// `second` is a convenience computed variable which converts a `TimeInterval` to seconds.
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    
    /// `millisecond` is a convenience computed variable which converts a `TimeInterval` to milliseconds.
    var millisecond: Int {
        return Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}
