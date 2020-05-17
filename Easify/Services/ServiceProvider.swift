//
//  ServiceProvider.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

class ServiceProvider {
    // MARK: Properties
    let plistReaderService: PlistReaderService
    let spotifyService: SpotifyService

    // MARK: Lifecycle
    init() throws {
        do {
            plistReaderService = try PlistReaderService(name: Constants.Files.spotifyPlist.rawValue, bundle: Bundle(for: type(of: self)))
            spotifyService = try SpotifyService(plistReaderService: plistReaderService)
        } catch {
            throw(error)
        }
    }
}
