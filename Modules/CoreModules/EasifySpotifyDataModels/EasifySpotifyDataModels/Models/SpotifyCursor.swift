//
//  SpotifyCursor.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - SpotifyCursor
/// Developer documentation: https://developer.spotify.com/documentation/web-api/reference/object-model/#cursor-object
public struct SpotifyCursor: Decodable {
    public let after: String
    public let before: String
}
