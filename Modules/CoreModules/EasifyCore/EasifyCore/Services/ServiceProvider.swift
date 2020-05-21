//
//  ServiceProvider.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import EasifyDefines

/// ServiceProvider contains various services which are critical to the application.
public class ServiceProvider {
    // MARK: - Properties
    /// Property `plistReaderService` returns an instance for reading values from `Plist` files.
    public let plistReaderService: PlistReaderService
    /// Property `spotifyService` returns an instance for interacting with Spotify API.
    public let spotifyService: SpotifyService

    // MARK: - Lifecycle
    public init() throws {
        do {
            plistReaderService = try PlistReaderService(name: EasifyConstants.Files.spotifyPlistFileName,
                                                        bundle: Bundle(for: type(of: self)))
            spotifyService = try SpotifyService(plistReaderService: plistReaderService)
        } catch {
            throw(error)
        }
    }
}
