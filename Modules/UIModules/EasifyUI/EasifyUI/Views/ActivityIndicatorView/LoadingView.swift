//
//  LoadingView.swift
//  EasifyUI
//
//  Created by Muhammed Said Özcan on 30/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: - LoadingView
/// Creates a view with loading indicator on top and content is blurred
public struct LoadingView<Content> where Content: View {
    // MARK: - Properties
    @Binding public private(set) var isShowing: Bool
    public let message: String
    public var content: () -> Content

    // MARK: - Lifecycle
    public init(isShowing: Binding<Bool>, message: String, content: @escaping () -> Content) {
        self._isShowing = isShowing
        self.message = message
        self.content = content
    }
}

// MARK: - LoadingView: View
extension LoadingView: View {
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 2 : 0)

                VStack {
                    Text(self.message)
                    EasifyUIActivityIndicatorView(style: .large,
                                                  hidesWhenStopped: true,
                                                  isAnimating: .constant(true))
                }
                .frame(width: geometry.size.width / 3,
                       height: geometry.size.height / 6)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}

#if DEBUG
// MARK: - LoadingView_Previews
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(true), message: "Loading") {
            NavigationView {
                List(["1", "2", "3", "4", "5"], id: \.self) { row in
                    Text(row)
                }.navigationBarTitle(Text("A List"), displayMode: .large)
            }
        }
    }
}
#endif
