//
//  Untitled.swift
//  SpringInABoxGame
//
//  Created by catalina obando on 11/1/25.
//

import SwiftUI

    

struct HowToPlayScreen: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Image("HowToPlay3") // Replace with your actual image name
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                Button(action: {
                    // TODO: Navigate to next screen
                }) {
                    Image("StartGame") // Replace with your button image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                }
                .scaleEffect(isAnimating ? 1.05 : 0.95) // ← Pulsing effect
                                .animation(
                                    .easeInOut(duration: 1.2).repeatForever(autoreverses: true),
                                    value: isAnimating
                                    )
                .padding(.bottom, 35)
           
            }
        }
    }
}

#Preview {
    HowToPlayScreen()
}
