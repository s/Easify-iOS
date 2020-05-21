//
//  SpotifyTrack.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - SpotifyTrack
public struct SpotifyTrack {
    public let artists: [SpotifyArtist]
    public let duration: String
    public let isExplicit: Bool
    public let externalURLs: [String: URL]
    public let href: URL
    public let id: String
    public let name: String
    public let previewURL: URL
    public let trackNumber: Int
    public let type: String
    public let uri: String
}

// MARK: - SpotifyTrack Coding Keys
private extension SpotifyTrack {
    enum CodingKeys: String, CodingKey {
        case artists
        case duration = "duration_ms"
        case isExplicit = "explicit"
        case externalURLs = "external_urls"
        case href
        case id
        case name
        case previewURL = "preview_url"
        case trackNumber = "track_number"
        case type
        case uri
    }
}

// MARK: - SpotifyTrack Private Helpers
private extension SpotifyTrack {
    static func decodeDuration(from container: KeyedDecodingContainer<SpotifyTrack.CodingKeys>) throws -> String {
        let durationInMiliseconds = try container.decode(Int.self, forKey: SpotifyTrack.CodingKeys.duration)
        return durationInMiliseconds.msToSeconds.minuteSecondMS
    }
}

// MARK: - SpotifyTrack: Decodable
extension SpotifyTrack: Decodable {
    public init(from decoder: Decoder) throws {
        // Root container
        let rootContainer = try decoder.container(keyedBy: SpotifyTrack.CodingKeys.self)

        // Decoding properties
        artists = try rootContainer.decode([SpotifyArtist].self, forKey: .artists)
        duration = try SpotifyTrack.decodeDuration(from: rootContainer)
        isExplicit = try rootContainer.decode(Bool.self, forKey: .isExplicit)
        externalURLs = try rootContainer.decodeURLForDictionaryValues(keyedBy: .externalURLs)
        href = try rootContainer.decodeURL(keyedBy: .href)
        id = try rootContainer.decode(String.self, forKey: .id)
        name = try rootContainer.decode(String.self, forKey: .name)
        previewURL = try rootContainer.decodeURL(keyedBy: .previewURL)
        trackNumber = try rootContainer.decode(Int.self, forKey: .trackNumber)
        type = try rootContainer.decode(String.self, forKey: .type)
        uri = try rootContainer.decode(String.self, forKey: .uri)
    }

}
