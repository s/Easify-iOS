//
//  HomeView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import SpotifyLogin

struct HomeView: View {
    var body: some View {
        Text("Welcome \(SpotifyLogin.shared.username ?? "")")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
