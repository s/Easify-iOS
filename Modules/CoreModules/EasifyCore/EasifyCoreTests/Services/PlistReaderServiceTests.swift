//
//  PlistReaderServiceTests.swift
//  EasifyTests
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import XCTest
@testable import EasifyCore

// swiftlint:disable force_cast
class PlistReaderServiceTests: XCTestCase {

    // MARK: - Properties
    private let testPlistFileName = "PlistReaderServiceTests"
    private var readerService: PlistReaderService?

    override func setUpWithError() throws {
        let bundle = Bundle(for: type(of: self))
        let plistNameThatDoesNotExist: String = "PlistThatDoesNotExist"
        XCTAssertThrowsError(try PlistReaderService(name: plistNameThatDoesNotExist, bundle: bundle)) { error in
            XCTAssert(error is PlistReaderServiceError)
            XCTAssertEqual(error as! PlistReaderServiceError,
                           PlistReaderServiceError.noSuchFileFound(fileName: "\(plistNameThatDoesNotExist).plist"))
        }
        XCTAssertNoThrow(self.readerService = try PlistReaderService(name: testPlistFileName, bundle: bundle))
    }

    func testStringKey() throws {
        let stringValue: String? = self.readerService?.read(key: "string_key")
        XCTAssertNotNil(stringValue)
        XCTAssertEqual(stringValue!, "string_value")
    }

    func testArrayKey() throws {
        let arrayValue: [String]? = self.readerService?.read(key: "array_key")
        XCTAssertNotNil(arrayValue)
        XCTAssert(arrayValue?.count == 2)
        XCTAssertEqual(arrayValue?.first, "array_value_0")
        XCTAssertEqual(arrayValue?.last, "array_value_1")
    }

    func testDictKey() throws {
        let dictValue: [String: String]? = self.readerService?.read(key: "dict_key")
        XCTAssertNotNil(dictValue)
        XCTAssert(!dictValue!.isEmpty)
        XCTAssertNotNil(dictValue?["dict_entry_0_key"])
        XCTAssertEqual(dictValue?["dict_entry_0_key"], "dict_entry_0_value")
        XCTAssertNotNil(dictValue?["dict_entry_1_key"])
        XCTAssertEqual(dictValue?["dict_entry_1_key"], "dict_entry_1_value")
    }

    func testBoolKey() throws {
        let boolValue1: Bool? = self.readerService?.read(key: "bool_key_yes")
        XCTAssertNotNil(boolValue1)
        XCTAssertEqual(boolValue1!, true)
        let boolValue2: Bool? = self.readerService?.read(key: "bool_key_no")
        XCTAssertNotNil(boolValue2)
        XCTAssertEqual(boolValue2!, false)
    }

    func testDateKey() throws {
        let dateValue: Date? = self.readerService?.read(key: "date_key")
        XCTAssertNotNil(dateValue)
        let dateComponents = DateComponents(timeZone: TimeZone(abbreviation: "CEST"), year: 2020, month: 5, day: 16, hour: 21, minute: 45, second: 54)
        let date = Calendar.current.date(from: dateComponents)
        XCTAssertEqual(dateValue!, date)
    }

    func testNumberKey() throws {
        let numberValue: Int? = self.readerService?.read(key: "number_key")
        XCTAssertNotNil(numberValue)
        XCTAssertEqual(numberValue!, 42)
    }

    func testDataKey() throws {
        let dataValue: Data? = self.readerService?.read(key: "data_key")
        XCTAssertNotNil(dataValue)
        XCTAssertEqual("Premature optimization is the root of all evil.", String(decoding: dataValue!, as: UTF8.self))
    }
}
