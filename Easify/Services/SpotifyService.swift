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
    case redirectURI = "redirect_uri"
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
}

// MARK: SpotifyService
class SpotifyService: NSObject {
    // MARK: Properties
    lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
        appRemote.delegate = self
        appRemote.connectionParameters.accessToken = self.accessToken
        return appRemote
    }()
    private let clientID: String
    private let redirectURI: URL
    private static let accessTokenKey = "nl.saidozcan.SpotifyService.AccessTokenKey"
    private var accessToken: String? = UserDefaults.standard.string(forKey: SpotifyService.accessTokenKey) {
        didSet {
            let defaults = UserDefaults.standard
            defaults.set(accessToken, forKey: SpotifyService.accessTokenKey)
        }
    }
    private let configuration: SPTConfiguration

    // MARK: Lifecycle
    init(plistReaderService: PlistReaderService) throws {
        if let clientIDString: String? = plistReaderService.read(key: SpotifyCredentialsKeys.clientID.rawValue),
            let nonOptionalClientID = clientIDString {
            self.clientID = nonOptionalClientID
        } else {
            throw SpotifyServiceError.cannotReadRequiredKey(message: "Cannot read the required key: \(SpotifyCredentialsKeys.clientID.rawValue)")
        }

        if let redirectURIString: String? = plistReaderService.read(key: SpotifyCredentialsKeys.redirectURI.rawValue),
            let nonOptionalRedirectURI = redirectURIString,
            let redirectURI = URL(string: nonOptionalRedirectURI) {
            self.redirectURI = redirectURI
        } else {
            throw SpotifyServiceError.cannotReadRequiredKey(message: "Cannot read the required key: \(SpotifyCredentialsKeys.redirectURI.rawValue)")
        }

        self.configuration = SPTConfiguration(clientID: clientID, redirectURL: redirectURI)
        super.init()
    }

    // MARK: Public
    func update(accessToken: String) {
        self.accessToken = accessToken
        self.appRemote.connectionParameters.accessToken = accessToken
    }
}

// MARK: SpotifyService: SPTAppRemoteDelegate
extension SpotifyService: SPTAppRemoteDelegate {
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {

    }

    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {

    }

    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {

    }
}
