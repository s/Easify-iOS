//
//  SpotifyArtist.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - SpotifyArtist
/// Developer documentation: https://developer.spotify.com/documentation/web-api/reference/object-model/#artist-object-simplified
public struct SpotifyArtist: Decodable {
    public let externalURLs: [String: String]
    public let href: URL?
    public let identifier: String
    public let name: String
    public let type: String
    public let uri: String
}

// MARK: - SpotifyArtist Coding Keys
private extension SpotifyArtist {
    enum CodingKeys: String, CodingKey {
        case externalURLs = "external_urls"
        case href
        case identifier = "id"
        case name
        case type
        case uri
    }
}
