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
        TabView {
            Text("First View")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }.tag(0)
            Text("Second View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }.tag(1)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
