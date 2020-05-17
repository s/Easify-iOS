//
//  Constants.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import SwiftUI

enum Constants {
    enum Files: String {
        case spotifyPlistFileName = "SpotifyCredentials"
    }

    enum Copies: String {
        case connectToSpotifyAccount = "Connect to your Spotify account"
        case connectCTA = "Connect"
        case easify = "Easify"
    }

    enum Spacings: CGFloat {
        case single = 8.0
        case double = 16.0
        case quadruple = 32.0
    }
}
