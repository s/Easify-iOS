//
//  ServiceProvider.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public class ServiceProvider {
    // MARK: Properties
    public let plistReaderService: PlistReaderService
    public let spotifyService: SpotifyService

    // MARK: Lifecycle
    public init() throws {
        do {
            plistReaderService = try PlistReaderService(name: Constants.Files.spotifyPlistFileName, bundle: Bundle(for: type(of: self)))
            spotifyService = try SpotifyService(plistReaderService: plistReaderService)
        } catch {
            throw(error)
        }
    }
}
