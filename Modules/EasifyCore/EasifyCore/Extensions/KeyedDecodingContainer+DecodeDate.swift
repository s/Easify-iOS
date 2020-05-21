//
//  KeyedDecodingContainer+DecodeDate.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 21/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public extension KeyedDecodingContainer {
    /// This method decodes a `Date` field for a given `CodingKey`.
    /// - parameter key: `Key` (a.k.a `CodingKey`)
    func decodeDate(keyedBy key: Key) throws -> Date {
        let startDateString = try decode(String.self, forKey: key)
        guard !startDateString.isEmpty else {
            let description = "Found empty string while trying to parse a date."
            throw DecodingError.dataCorruptedError(forKey: key,
                                                   in: self,
                                                   debugDescription: description)
        }
        // Trying to format the date
        guard let date = DateFormatter.iso8601Full.date(from: startDateString) else {
            let description = "Date string does not match format expected by formatter."
            throw DecodingError.dataCorruptedError(forKey: key,
                                                   in: self,
                                                   debugDescription: description)
        }

        return date
    }

}
