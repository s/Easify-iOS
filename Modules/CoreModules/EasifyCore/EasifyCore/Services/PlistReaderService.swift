//
//  PlistReaderService.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - PlistReaderServiceError
public enum PlistReaderServiceError: Error, Equatable {
    case noSuchFileFound(fileName: String)
    case dataReadingError(message: String)

    var description: String {
        switch self {
        case .noSuchFileFound(let fileName):
            return "No file found named: \(fileName)"
        case .dataReadingError(let message):
            return message
        }
    }
}

// MARK: - PlistReaderService
/// `PlistReaderService` provides number of readonly methods which can be used when interacting with property list type of files.
public class PlistReaderService {
    // MARK: - Properties
    private let plistName: String
    private let plistPath: URL
    private let plistContents: [String: Any]

    // MARK: - Lifecycle
    /// `PlistReaderService` initializer tries to initialize itself but if it cannot find the given file name in the given `Bundle` it throws an `Error`.
    /// - parameter name: Name of the property list file.
    /// - parameter bundle: The bundle where the property list is in.
    init(name: String, bundle: Bundle) throws {
        plistName = name

        guard let plistPathString = bundle.path(forResource: name, ofType: "plist") else {
            throw PlistReaderServiceError.noSuchFileFound(fileName: "\(name).plist")
        }
        plistPath = URL(fileURLWithPath: plistPathString)

        do {
            let plistContentsData = try Data(contentsOf: plistPath)
            guard let plistContents = try PropertyListSerialization.propertyList(from: plistContentsData, format: nil) as? [String: Any] else {
                throw PlistReaderServiceError.dataReadingError(message: "Can't read \(name).plist data as [String: Any]")
            }
            self.plistContents = plistContents
        } catch {
           throw PlistReaderServiceError.dataReadingError(message: "Can't read \(name).plist data as [String: Any]. Error message: \(error)")
        }
    }

    // MARK: - Public
    /// `read<T>` method takes a `key` parameter and returns the value of that key in the property list if found. Otherwise it returns nil.
    /// - parameter key: The key to read its value in the property list.
    func read<T>(key: String) -> T? {
        return plistContents[key] as? T
    }
}
