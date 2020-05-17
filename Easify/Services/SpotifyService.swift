//
//  SpotifyService.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: SpotifyCredentialsKeys
private enum SpotifyCredentialsKeys: String {
    case clientID = "client_id"
    case redirectURL = "redirect_url"
    case tokenSwapURL = "token_swap_url"
    case tokenRefreshURL = "token_refresh_url"
}

// MARK: SpotifyServiceError
enum SpotifyServiceError: Error {
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
class SpotifyService: NSObject {
    // MARK: Public Properties
    lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
        appRemote.delegate = self
        appRemote.connectionParameters.accessToken = self.accessToken
        return appRemote
    }()
    lazy var sessionManager: SPTSessionManager = {
        let manager = SPTSessionManager(configuration: configuration, delegate: self)
        return manager
    }()

    // MARK: Private Properties
    private let configuration: SPTConfiguration
    private static let accessTokenKey = "nl.saidozcan.SpotifyService.AccessTokenKey"
    private var accessToken: String? = UserDefaults.standard.string(forKey: SpotifyService.accessTokenKey) {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(accessToken, forKey: SpotifyService.accessTokenKey)
        }
    }

    // MARK: Lifecycle
    init(plistReaderService: PlistReaderService) throws {
        guard let clientID: String = plistReaderService.read(key: SpotifyCredentialsKeys.clientID.rawValue) else {
            throw SpotifyServiceError.readingError(for: SpotifyCredentialsKeys.clientID.rawValue)
        }

        guard
            let redirectURLString: String = plistReaderService.read(key: SpotifyCredentialsKeys.redirectURL.rawValue),
            let redirectURL = URL(string: redirectURLString)
        else {
            throw SpotifyServiceError.readingError(for: SpotifyCredentialsKeys.redirectURL.rawValue)
        }

        self.configuration = SPTConfiguration(clientID: clientID, redirectURL: redirectURL)
        self.configuration.tokenSwapURL = plistReaderService.read(key: SpotifyCredentialsKeys.tokenSwapURL.rawValue)
        self.configuration.tokenRefreshURL = plistReaderService.read(key: SpotifyCredentialsKeys.tokenRefreshURL.rawValue)
        super.init()
    }

    // MARK: Public
    func update(accessToken: String) {
        self.accessToken = accessToken
        self.appRemote.connectionParameters.accessToken = accessToken
    }

    func login() {
        let scope: SPTScope = [
            .playlistReadPrivate,
            .playlistReadCollaborative,
            .playlistModifyPublic,
            .userReadRecentlyPlayed,
            .userLibraryModify,
            .userReadPrivate,
            .userTopRead
        ]
        sessionManager.initiateSession(with: scope, options: .clientOnly)
    }
}

// MARK: SpotifyService: SPTAppRemoteDelegate
extension SpotifyService: SPTAppRemoteDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        print("appRemoteDidEstablishConnection")
    }

    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        print("didFailConnectionAttemptWithError")
    }

    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        print("didDisconnectWithError")
    }
}

// MARK: SpotifyService: SPTSessionManager
extension SpotifyService: SPTSessionManagerDelegate {
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        appRemote.connectionParameters.accessToken = session.accessToken
        appRemote.connect()
    }

    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {

    }

    func sessionManager(manager: SPTSessionManager, didRenew session: SPTSession) {

    }
}
