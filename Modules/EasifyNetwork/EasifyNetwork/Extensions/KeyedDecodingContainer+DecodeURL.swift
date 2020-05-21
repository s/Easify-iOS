//
//  KeyedDecodingContainer+DecodeURL.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

extension KeyedDecodingContainer {
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

    func decodeURLForDictionaryValues<K: Hashable & Decodable>(keyedBy key: Key) throws -> [K: URL] {
        var dictionary: [K: Any] = try decode([K: String].self, forKey: key)
        for (k, v) in dictionary {
            guard let value = v as? String, let url = URL(string: value) else {
                let description = "Cannot generate URL from urlString: \(v)"
                throw DecodingError.dataCorruptedError(forKey: key,
                                                       in: self,
                                                       debugDescription: description)
            }
            dictionary[k] = url
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
