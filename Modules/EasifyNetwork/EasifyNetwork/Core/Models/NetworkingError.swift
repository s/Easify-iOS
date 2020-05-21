//
//  NetworkingError.swift
//  Networking
//
//  Created by Ilter Cengiz on 22/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation

/// Error type to be used in Networking module
public enum NetworkingError: Error {
    
    /// Indicates that there has been a connection error to the server
    case connectionError(Error)
    
    /// Indicates not ok HTTP response code: 200..<300
    case httpError(Error)
    
    /// Indicates that parsing is not possible with the current data and
    /// given type to parse into.
    case decodingFailed(DecodingError)
    
    /// In case an error occures which is not identified
    case undefined
}
