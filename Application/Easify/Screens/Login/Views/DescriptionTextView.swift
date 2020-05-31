//
//  DescriptionTextView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyCore
import EasifyDefines

struct DescriptionTextView: View {
    var body: some View {
        Text(EasifyDefines.Copies.connectToSpotifyAccount)
            .kerning(1.0)
            .fontWeight(.bold)
            .font(.callout)
            .foregroundColor(.white)
            .padding()
    }
}

struct DescriptionTextView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionTextView().background(Color.black)
    }
}
