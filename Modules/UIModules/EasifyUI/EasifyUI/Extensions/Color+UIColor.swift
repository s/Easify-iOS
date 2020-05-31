//
//  Color+UIColor.swift
//  EasifyUI
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: - EasifyColorComponents
struct EasifyColorComponents {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
}

extension Color {
    /// Converts `Color` to `UIColor`
    public func uiColor() -> UIColor {
        let components = self.components()
        return UIColor(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }

    private func components() -> EasifyColorComponents {
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            alpha = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return EasifyColorComponents(red: red, green: green, blue: blue, alpha: alpha)
    }
}
