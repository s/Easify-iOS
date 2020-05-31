//
//  EasifyUIDefines.swift
//  EasifyUI
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: - EasifyUIDefines
/// Holds a set of definitions for various values
public struct EasifyUIDefines {

    /// `EasifyUIDefines.Spacings` contains list of spacing metrics for more consistent user interface.
    public struct Spacings {
        /// `EasifyDefines.Spacings.single` returns 8.0 of type `CGFloat`
        public static let single: CGFloat = 8.0

        /// `EasifyDefines.Spacings.double` returns 16.0 of type `CGFloat`
        public static let double: CGFloat = 16.0

        /// `EasifyDefines.Spacings.quadruple` returns 32.0 of type `CGFloat`
        public static let quadruple: CGFloat = 32.0
    }

    /// `EasifyUIDefines.Sizes` contains list of size metrics for more consistent user interface.
    public struct Sizes {
        /// `EasifyDefines.Sizes.tabBarItemSize` returns 16.0 of type `CGFloat`
        public static let tabBarItemSize: CGFloat = 24.0

        /// `EasifyUIDefines.Sizes.userProfileIcon` returns 64.0 of type `CGFloat`
        public static let userProfileIcon: CGFloat = 64.0
    }

    /// `EasifyUIDefines.EasifyTabBar` contains list off definitions that are used inside tab bar.
    public struct EasifyTabBar {
        /// `EasifyUIDefines.EasifyTabBar.backmostBackgroundColor` returns the `Color` that is used for the backmost view's background.
        public static let backmostBackgroundColor: Color = Color(.secondarySystemBackground)

        /// `EasifyUIDefines.EasifyTabBar.contentBackgroundColor` returns the `Color` that is used for the tab view's content's background.
        public static let contentBackgroundColor: Color = Color(.tertiarySystemBackground)

        /// `EasifyUIDefines.EasifyTabBar.indicatorBackgroundColorSelected` returns the `Color` that is used for the tab indicator's selected state.
        public static let indicatorBackgroundColorSelected: Color = .primary

        /// `EasifyUIDefines.EasifyTabBar.indicatorBackgroundColorSelected` returns the `Color` that is used for the tab indicator's not selected state.
        public static let indicatorBackgroundColorNotSelected: Color = Color(.systemGray2)

        /// Defines `EdgeInsets` for a particular tab item.
        static let tabItemPadding: EdgeInsets = EdgeInsets(top: Spacings.single,
                                                           leading: Spacings.double,
                                                           bottom: Spacings.single,
                                                           trailing: Spacings.double)
    }

    /// `EasifyUIDefines.Colors` contains list off definitions that are used inside tab bar.
    public struct Colors {
        /// `EasifyUIDefines.Colors.easifyGray` returns the `Color` that is used for the gray colors.
        public static let easifyGray: Color = Color(.systemGray2)
    }
}
