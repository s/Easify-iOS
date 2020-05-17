//
//  BackgroundView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("LoginViewBG")
            .blur(radius: 4)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
