//
//  KeyedDecodingContainer+DecodeURL.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public extension KeyedDecodingContainer {
    /// This method decodes a `URL` field for a given `CodingKey`.
    /// - parameter key: `Key` (a.k.a `CodingKey`)
    func decodeURL(keyedBy key: Key) throws -> URL {
        let urlString = try decode(String.self, forKey: key)
        guard let url = URL(string: urlString) else {
            let description = "Cannot generate URL from urlString: \(urlString)"
            throw DecodingError.dataCorruptedError(forKey: key,
                                                   in: self,
                                                   debugDescription: description)
        }
        return url
    }

    /// This method decodes a `[K: URL]` field for a given `CodingKey`. In essence, it's used for convenience to build a dictionary where values are in `URL` type.
    /// - parameter key: `Key` (a.k.a `CodingKey`)
    func decodeURLForDictionaryValues<K: Hashable & Decodable>(keyedBy key: Key) throws -> [K: URL] {
        var dictionary: [K: Any] = try decode([K: String].self, forKey: key)
        for (dictKey, dictVal) in dictionary {
            guard let value = dictVal as? String, let url = URL(string: value) else {
                let description = "Cannot generate URL from urlString: \(dictVal)"
                throw DecodingError.dataCorruptedError(forKey: key,
                                                       in: self,
                                                       debugDescription: description)
            }
            dictionary[dictKey] = url
        }
        guard let dict = dictionary as? [K: URL] else {
            let description = "Cannot cast [K: Any] dictionary to [K: String] dictionary."
            throw DecodingError.dataCorruptedError(forKey: key,
                                                   in: self,
                                                   debugDescription: description)
        }
        return dict
    }
}
