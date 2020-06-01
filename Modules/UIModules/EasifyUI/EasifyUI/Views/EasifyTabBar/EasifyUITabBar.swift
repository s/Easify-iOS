//
//  EasifyUITabBar.swift
//  EasifyUI
//
//  Created by Muhammed Said Özcan on 29/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: - EasifyUITabBar
/// Creates a Tab Bar
public struct EasifyUITabBar {
    // MARK: - Properties
    let items: [EasifyUITabBarItem]
    @State private var selectedIndex: Int = 0

    // MARK: - Lifecycle
    public init(items: [EasifyUITabBarItem], selectedIndex: Int) {
        self.items = items
        self.selectedIndex = selectedIndex
    }

    // MARK: - Private
    private func item(at index: Int) -> some View {
        Button(action: {
            withAnimation(.default) {
                self.selectedIndex = index
            }
        }) {
            VStack {
                items[index].image
                    .resizable()
                    .frame(width: EasifyUIDefines.Sizes.tabBarItemSize,
                           height: EasifyUIDefines.Sizes.tabBarItemSize)
                items[index].text.font(.footnote)
            }
        }
        .anchorPreference(key: AnchorKey.self,
                          value: .bounds,
                          transform: { self.selectedIndex == index ? $0 : nil })
        .accentColor(index == selectedIndex ?
            EasifyUIDefines.EasifyTabBar.indicatorBackgroundColorSelected :
            EasifyUIDefines.EasifyTabBar.indicatorBackgroundColorNotSelected)
        .padding(EasifyUIDefines.EasifyTabBar.tabItemPadding)
    }

    private func indicator(_ bounds: Anchor<CGRect>?) -> some View {
        GeometryReader { proxy in
            if bounds != nil {
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: proxy[bounds!].width, height: 1)
                    .offset(x: proxy[bounds!].minX, y: -4)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
        }
    }
}

// MARK: - EasifyUITabBar: View
extension EasifyUITabBar: View {
    // MARK: - View
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                EasifyUIDefines.EasifyTabBar.backmostBackgroundColor.edgesIgnoringSafeArea(.top)
                VStack(spacing: .zero) {
                    self.items[self.selectedIndex].content

                    ZStack {
                        VStack(spacing: .zero) {
                            Rectangle()
                                .fill(Color(UIColor.tertiarySystemBackground))
                                .frame(width: geometry.size.width, height: 1)
                                .shadow(color: .primary, radius: 2.0)
                            HStack(spacing: EasifyUIDefines.Spacings.quadruple) {
                                ForEach(self.items.indices, id: \.self) {
                                    self.item(at: $0)
                                }
                            }.overlayPreferenceValue(AnchorKey.self, {
                                self.indicator($0)
                            })
                            .frame(width: geometry.size.width, height: 92)
                            .offset(x: 0, y: -EasifyUIDefines.Spacings.single)
                            .background(EasifyUIDefines.EasifyTabBar.tabBarBackgroundColor)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#if DEBUG
// MARK: - EasifyUITabBarPreviewTab
struct EasifyUITabBarPreviewTab: EasifyUITabBarItem {
    var image: Image {
        Image(systemName: "star.fill")
    }

    var text: Text {
        Text("Demo Tab")
    }

    var content: AnyView {
        AnyView(Text("Demo Tab Content"))
    }
}

// MARK: - EasifyUITabBar_Previews
struct EasifyUITabBar_Previews: PreviewProvider {
    static var previews: some View {
        EasifyUITabBar(items: [EasifyUITabBarPreviewTab()], selectedIndex: 0)
    }
}
#endif
