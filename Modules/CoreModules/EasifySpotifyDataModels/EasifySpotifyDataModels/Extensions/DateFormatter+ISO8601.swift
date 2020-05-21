//
//  DateFormatter+ISO8601.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 21/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public extension DateFormatter {
    /// `iso8601Full` is a `DateFormatter` which uses `yyyy-MM-dd'T'HH:mm:ssZ` format for timestamps.
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
