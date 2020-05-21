//
//  BaseURL.swift
//  Networking
//
//  Created by Ilter Cengiz on 30/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation

/// Represents a URL for an environment
public struct BaseURL {
    
    /// Schema of the URL (https)
    public var scheme: String
    
    /// Hostname of the URL (www.example.com)
    public var host: String
    
    /// Lifecycle
    public init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
}
