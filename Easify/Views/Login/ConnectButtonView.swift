//
//  ConnectButtonView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: ConnectButtonView
struct ConnectButtonView: View {
    // MARK: Properties
    private let isEnabled: Bool

    // MARK: Lifecycle
    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }

    // MARK: UI
    var body: some View {
        Group {
            Button(action: {
                print("Hello button tapped!")
            }) {
                Text(Constants.Copies.connectCTA.rawValue.uppercased())
                    .kerning(4)
                    .fontWeight(.heavy)
                    .font(.callout)
                    .foregroundColor(.white)
                    .background(Color.spotifyGreen)
                    .padding(EdgeInsets.doubleQuadruple)
            }
            .frame(height: 44)
            .background(Color.spotifyGreen)
            .cornerRadius(22)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.spotifyGreen, lineWidth: 1)
            ).disabled(!isEnabled)
        }

    }
}

struct ConnectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectButtonView(isEnabled: true)
    }
}
