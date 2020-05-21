//
//  EasifyNetworkTests.swift
//  EasifyNetworkTests
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import XCTest
import Combine
import Alamofire
@testable import EasifyNetwork

class EasifyNetworkTests: XCTestCase {
    @Atomic private var storage: Set<AnyCancellable> = []

    func testExample() throws {
        let timeout: TimeInterval = 10
        //SpotifyNetworkService.recentlyPlayedTracks.fetch()
        let endpoint = SpotifyRecentlyPlayedEndpoint()
        let responseReceived = expectation(description: "response should be received")
        let completionReceived = expectation(description: "stream should complete")
        var response: DataResponse<SpotifyRecentlyPlayedEndpoint.Response, AFError>?

        // When
        store {
            AF.request(endpoint)
                .publishDecodable(type: SpotifyPagination<SpotifyPlayHistoryItem>.self)
                .sink(receiveCompletion: { _ in completionReceived.fulfill() },
                      receiveValue: { response = $0; responseReceived.fulfill() })
        }

        waitForExpectations(timeout: timeout)

        // Then
        print(response?.response?.statusCode)
//        XCTAssertTrue(response?.result.isSuccess == true)
    }

    private func store(_ toStore: () -> AnyCancellable) {
        storage.insert(toStore())
    }
}
