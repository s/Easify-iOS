//
//  AppNameView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyCore

struct AppNameView: View {
    var body: some View {
        Text(Constants.Copies.easify.uppercased())
            .kerning(1.0)
            .fontWeight(.heavy)
            .font(.title)
            .foregroundColor(.white)
            .padding()
    }
}

struct AppNameView_Previews: PreviewProvider {
    static var previews: some View {
        AppNameView().background(Color.green)
    }
}
