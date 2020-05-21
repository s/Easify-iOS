//
//  ActivityIndicatorView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - ActivityIndicatorView
/// ActivityIndicatorView provides a wrapper around `UIActivityIndicatorView` to show a loading indicator for asynchronous operations.
struct ActivityIndicatorView {
    let style: UIActivityIndicatorView.Style
}

// MARK: - ActivityIndicatorView: UIViewRepresentable
extension ActivityIndicatorView: UIViewRepresentable {
    public typealias UIViewType = UIActivityIndicatorView

    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
    }
}
