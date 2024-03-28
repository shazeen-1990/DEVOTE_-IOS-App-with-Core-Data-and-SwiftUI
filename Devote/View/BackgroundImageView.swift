//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Shazeen Thowfeek on 26/03/2024.
//

import SwiftUI

struct BackgroundImageView: View {
    
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFit()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
