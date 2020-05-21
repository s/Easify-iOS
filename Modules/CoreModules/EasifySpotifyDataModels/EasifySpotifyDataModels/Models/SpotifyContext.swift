//
//  SpotifyContext.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - SpotifyContext
/// Developer documentation: https://developer.spotify.com/documentation/web-api/reference/object-model/#context-object
public struct SpotifyContext {
    public let type: String
    public let href: URL
    public let externalURLs: [String: URL]
    public let uri: String
}

// MARK: - SpotifyContext Coding Keys
private extension SpotifyContext {
    enum CodingKeys: String, CodingKey {
        case type
        case href
        case externalURLs = "external_urls"
        case uri
    }
}

// MARK: - SpotifyContext: Decodable
extension SpotifyContext: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SpotifyContext.CodingKeys.self)

        type = try container.decode(String.self, forKey: .type)
        href = try container.decodeURL(keyedBy: .href)
        externalURLs = try container.decodeURLForDictionaryValues(keyedBy: .externalURLs)
        uri = try container.decode(String.self, forKey: .uri)
    }
}
