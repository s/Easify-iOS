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
    // MARK: - Properties
    private var spotifyService: SpotifyService?

    // MARK: - Tests
    override func setUpWithError() throws {
        let bundle = Bundle(for: type(of: self))
        let plistName = EasifyDefines.Files.spotifyPlistFileName
        var plistReaderService: PlistReaderService?
        XCTAssertNoThrow(plistReaderService = try PlistReaderService(name: plistName, bundle: bundle))
        if let plistReaderService = plistReaderService {
            XCTAssertNoThrow(self.spotifyService = try SpotifyService(plistReaderService: plistReaderService))
        }
    }

    func testSpotifyServiceInitialization() {
        let name = EasifyDefines.Files.spotifyPlistFileName
        let bundle = Bundle(for: type(of: self))
        var plistReaderService: PlistReaderService?
        XCTAssertNoThrow(plistReaderService = try PlistReaderService(name: name, bundle: bundle))
        XCTAssertNotNil(plistReaderService)
        guard let prService = plistReaderService else {
            XCTFail("Found unexpected nil PlistReaderService.")
            return
        }
        XCTAssertNoThrow(try SpotifyService(plistReaderService: prService))
    }

    func testSpotifyServiceLogin() {
        guard let spotifyService = spotifyService else {
            XCTFail("Found nil SpotifyService.")
            return
        }
        XCTAssertTrue(!spotifyService.isAttemptingToLogin)
        let exp = expectation(description: "Login Expectation")
        spotifyService.login { _, _ in
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2.0)
    }

//    func testSpotifyRecentlyPlayedTracksAPI() {
//        spotifyService?.fetchRecentlyPlayedTracks()
//    }
}
