//
//  EasifyConstants.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import SwiftUI

/// Constants provides an array of definitions which can be used across the whole application.
public struct EasifyConstants {
    /// `EasifyConstants.Files` provides names for auxiliary files such as property list kind of files.
    public struct Files {
        public static let spotifyPlistFileName: String = "SpotifyCredentials"
    }

    /// `EasifyConstants.Copies` provides various strings to be shown in the user interface to the user. This must be localized but for demo purposes they are hardcoded for the time being.
    public struct Copies {
        public static let connectToSpotifyAccount: String = "Connect to your Spotify account"
        public static let connectCTA: String = "Connect"
        public static let easify: String = "Easify"
        public static let backgroundImageReference: String = "Image: Ron Smith on Unsplash"
    }

    /// `EasifyConstants.Spacings` contains list of spacing metrics for more consistent user interface.
    public struct Spacings {
        /// `EasifyConstants.Spacings.single` returns 8.0 of type `CGFloat`
        public static let single: CGFloat = 8.0
        
        /// `EasifyConstants.Spacings.double` returns 16.0 of type `CGFloat`
        public static let double: CGFloat = 16.0
        
        /// `EasifyConstants.Spacings.quadruple` returns 32.0 of type `CGFloat`
        public static let quadruple: CGFloat = 32.0
    }

    /// `EasifyConstants.URLS` consists of number of hardcoded urls which are used in the application.
    public struct URLS {
        public static let backgroundImageURL: String = "https://unsplash.com/photos/tknOyEefp2k"
    }
    
    /// `EasifyConstants.StorageKeys` provides a global key for common resources such as `UserDefaults`.
    public struct StorageKeys {
        /// `spotifyAccessToken` returns a `String` to be used for storing the Spotify API access token in any storage service.
        public static let spotifyAccessToken: String = "nl.saidozcan.EasifyDefines.EasifyConstants.StorageKeys.spotifyAccessToken"
    }
}
