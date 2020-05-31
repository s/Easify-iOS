//
//  ServiceProviderTests.swift
//  EasifyCoreTests
//
//  Created by Muhammed Said Özcan on 22/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import XCTest
@testable import EasifyCore

class ServiceProviderTests: XCTestCase {

    // MARK: - Tests
    func testServiceProviderInitialization() {
        var serviceProvider: ServiceProvider?
        XCTAssertNoThrow(serviceProvider = try ServiceProvider())
        XCTAssertNotNil(serviceProvider)
        if serviceProvider == nil {
            XCTFail("Found unexpected nil ServiceProvider.")
            return
        }
    }
}
