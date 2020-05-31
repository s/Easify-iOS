//
//  BackgroundView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyCore
import EasifyDefines
import EasifyUI

// MARK: - BackgroundView
struct BackgroundView {}

// MARK: - BackgroundView: View
extension BackgroundView: View {
    var body: some View {
        ZStack {
            HStack {
                Image("LoginViewBG")
                .blur(radius: 4)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height)
            }
            VStack(alignment: .trailing) {
                Spacer()
                HStack {
                    ButtonWithLinkView()
                }.offset(x: 0, y: -EasifyUIDefines.Spacings.quadruple)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
