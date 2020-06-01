//
//  AuthorizableEndpoint.swift
//  EasifySpotifyDataModels
//
//  Created by Muhammed Said Özcan on 01/06/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Combine

public typealias AuthorizableEndpointPromiseType = () -> Future<String, Error>

// MARK: - AuthorizableEndpoint
public protocol AuthorizableEndpoint {
    var authTokenPromise: AuthorizableEndpointPromiseType { get }
}
