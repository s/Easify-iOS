//
//  SpotifyService.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Combine
import Foundation
import SpotifyLogin

// MARK: SpotifyCredentialsKeys
private enum SpotifyCredentialsKeys: String {
    case clientID = "client_id"
    case clientSecret = "client_secret"
    case redirectURL = "redirect_url"
}

// MARK: SpotifyServiceError
public enum SpotifyServiceError: Error {
    case cannotReadRequiredKey(message: String)

    var description: String {
        switch self {
        case .cannotReadRequiredKey(let message):
            return message
        }
    }

    static func readingError(for key: String) -> SpotifyServiceError {
        return SpotifyServiceError.cannotReadRequiredKey(message: "Cannot read the required key: \(key)")
    }
}

// MARK: SpotifyService
public class SpotifyService: ObservableObject {
    // MARK: Properties
    static let loginScopes: [Scope] = [
        .userReadTop,
        .playlistModifyPublic,
        .playlistReadPrivate,
        .playlistReadCollaborative,
        .userFollowRead,
        .userFollowModify
    ]
    private static let accessTokenKey = "nl.saidozcan.SpotifyService.accessTokenKey"
    @Published public private(set) var isLoggedIn: Bool = false

    // MARK: Lifecycle
    public init(plistReaderService: PlistReaderService) throws {
        guard let clientID: String = plistReaderService.read(key: SpotifyCredentialsKeys.clientID.rawValue) else {
            throw SpotifyServiceError.readingError(for: SpotifyCredentialsKeys.clientID.rawValue)
        }

        guard
            let redirectURLString: String = plistReaderService.read(key: SpotifyCredentialsKeys.redirectURL.rawValue),
            let redirectURL = URL(string: redirectURLString)
        else {
            throw SpotifyServiceError.readingError(for: SpotifyCredentialsKeys.redirectURL.rawValue)
        }

        guard let clientSecret: String = plistReaderService.read(key: SpotifyCredentialsKeys.clientSecret.rawValue) else {
            throw SpotifyServiceError.readingError(for: SpotifyCredentialsKeys.clientSecret.rawValue)
        }

        SpotifyLogin.shared.configure(clientID: clientID, clientSecret: clientSecret, redirectURL: redirectURL)

        let authSemaphore = DispatchSemaphore(value: 0)
        SpotifyLogin.shared.getAccessToken { [weak self] (accessToken, _) in
            self?.isLoggedIn = (accessToken != nil)
            authSemaphore.signal()
        }
        authSemaphore.wait()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didLoginSuccessfully),
                                               name: .SpotifyLoginSuccessful,
                                               object: nil)
    }

    // MARK: Private
    @objc private func didLoginSuccessfully() {
        SpotifyLogin.shared.getAccessToken { [weak self] (accessToken, _) in
            if let accessToken = accessToken {
                self?.isLoggedIn = true
            }
        }
    }
}
