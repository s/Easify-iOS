//
//  Response.swift
//  Networking
//
//  Created by Ilter Cengiz on 22/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation

/// Holds all response related information
public struct Response<Value> {
    
    /// The request object that this response belongs to
    public let request: URLRequest?
    
    /// HTTP response data for the request
    public let response: HTTPURLResponse?
    
    /// Raw response data for the request
    public let data: Data?
    
    /// Parsed response value for the given type
    public let result: Result<Value, Error>
    
}
