//
//  SpotifyPagination.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - SpotifyPagination
/// Developer documentation: https://developer.spotify.com/documentation/web-api/reference/object-model/#paging-object
public struct SpotifyPagination <SpotifyItem: Decodable> {
    public let href: URL
    public let items: [SpotifyItem]
    public let limit: Int
    public let next: URL
    public let cursor: SpotifyCursor
    public let total: Int?
}

// MARK: - SpotifyPagination Coding Keys
private extension SpotifyPagination {
    enum CodingKeys: String, CodingKey {
        case href
        case items
        case limit
        case next
        case cursor = "cursors"
        case total
    }
}

// MARK: - SpotifyPagination: Decodable
extension SpotifyPagination: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SpotifyPagination.CodingKeys.self)

        href = try container.decodeURL(keyedBy: .href)
        items = try container.decode([SpotifyItem].self, forKey: .items)
        limit = try container.decode(Int.self, forKey: .limit)
        next = try container.decodeURL(keyedBy: .next)
        cursor = try container.decode(SpotifyCursor.self, forKey: .cursor)
        total = try container.decodeIfPresent(Int.self, forKey: .total)
    }
}
