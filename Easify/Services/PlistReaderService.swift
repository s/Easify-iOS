//
//  PlistReaderService.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: PlistReaderServiceError
enum PlistReaderServiceError: Error, Equatable {
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

// MARK: PlistReaderService
class PlistReaderService {
    // MARK: Properties
    private let plistName: String
    private let plistPath: URL
    private let plistContents: [String: Any]

    // MARK: Lifecycle
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

    // MARK: Public
    func read<T>(key: String) -> T? {
        return plistContents[key] as? T
    }
}
