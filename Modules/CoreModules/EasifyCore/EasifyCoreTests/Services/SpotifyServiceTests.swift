//
//  SpotifyServiceTests.swift
//  EasifyCoreTests
//
//  Created by Muhammed Said Özcan on 22/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import XCTest
@testable import EasifyCore
@testable import EasifyDefines
@testable import SpotifyLogin

class SpotifyServiceTests: XCTestCase {
    // MARK: - Tests
    func testSpotifyServiceInitialization() {
        let name = EasifyConstants.Files.spotifyPlistFileName
        let bundle = Bundle(for: type(of: self))
        var plistReaderService: PlistReaderService? = nil
        XCTAssertNoThrow(plistReaderService = try PlistReaderService(name: name, bundle: bundle))
        XCTAssertNotNil(plistReaderService)
        guard let prService = plistReaderService else {
            XCTFail("Found unexpected nil PlistReaderService.")
            return
        }
        XCTAssertNoThrow(try SpotifyService(plistReaderService: prService))
    }
 
    func testSpotifyRecentlyPlayedTracksAPI() {
        SpotifyService.fetchRecentlyPlayedTracks()
    }
}
