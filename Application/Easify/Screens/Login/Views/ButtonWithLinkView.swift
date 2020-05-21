//
//  ButtonWithLinkView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyCore
import SafariServices

// MARK: - ButtonWithLinkView
struct ButtonWithLinkView: View {
    // MARK: - Properties
    @State var showSafari = false

    // MARK: - 
    var body: some View {
        URL(string: Constants.URLS.backgroundImageURL).map { url in
            Button(action: {
                self.showSafari = true
            }) {
                Text(Constants.Copies.backgroundImageReference)
                    .fontWeight(.light)
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(height: 32)
            .background(Color.black.opacity(0.7))
            .sheet(isPresented: $showSafari) {
                SafariView(url: url)
            }
        }
    }
}
