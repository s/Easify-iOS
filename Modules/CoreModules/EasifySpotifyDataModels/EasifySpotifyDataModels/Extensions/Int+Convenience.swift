//
//  Int+Convenience.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

public extension Int {
    /// `msToSeconds` converts miliseconds to seconds.
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}
