//
//  EasifyDefines.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import SwiftUI

/// Constants provides an array of definitions which can be used across the whole application.
public struct EasifyDefines {
    /// `EasifyDefines.Files` provides names for auxiliary files such as property list kind of files.
    public struct Files {
        /// `spotifyPlistFileName` provides the name of plist file for Spotify API credentials.
        public static let spotifyPlistFileName: String = "SpotifyCredentials"
    }

    /// `EasifyDefines.Copies` provides various strings to be shown in the user interface to the user. This must be localized but for demo purposes they are hardcoded for the time being.
    public struct Copies {
        public static let connectToSpotifyAccount: String = "Connect to your Spotify account"
        public static let connectCTA: String = "Connect"
        public static let easify: String = "Easify"
        public static let backgroundImageReference: String = "Image: Ron Smith on Unsplash"
        public static let recentlyPlayed = "Recently Played"
        public static let loading = "Loading..."
        public static let settings = "Settings"
    }

    /// `EasifyDefines.URLS` consists of number of hardcoded urls which are used in the application.
    public struct URLS {
        public static let backgroundImageURL: String = "https://unsplash.com/photos/tknOyEefp2k"
    }

    /// `EasifyDefines.UserDefaults` provides a global key for common resources such as `UserDefaults`.
    public struct UserDefaults {
        /// `suiteName` returns the global `UserDefaults` suite identifier to share data across app and frameworks
        public static let suiteName: String = "group.EasifySharingDefaults"
        /// `spotifyAccessToken` returns a `String` to be used for storing the Spotify API access token in any storage service.
        public static let spotifyAccessToken: String = "nl.saidozcan.EasifyDefines.EasifyDefines.UserDefaults.spotifyAccessToken"
    }
}
