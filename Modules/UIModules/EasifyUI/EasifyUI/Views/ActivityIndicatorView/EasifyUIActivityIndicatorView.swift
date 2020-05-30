//
//  EasifyUIActivityIndicatorView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - EasifyUIActivityIndicatorView
/// EasifyUIActivityIndicatorView provides a wrapper around `UIActivityIndicatorView` to show a loading indicator for asynchronous operations.
struct EasifyUIActivityIndicatorView {
    // MARK: - Properties
    let style: UIActivityIndicatorView.Style
    let hidesWhenStopped: Bool
    @Binding var isAnimating: Bool
}

// MARK: - EasifyUIActivityIndicatorView: UIViewRepresentable
extension EasifyUIActivityIndicatorView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView

    func makeUIView(context: UIViewRepresentableContext<EasifyUIActivityIndicatorView>) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: style)
        view.hidesWhenStopped = hidesWhenStopped
        return view
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<EasifyUIActivityIndicatorView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
