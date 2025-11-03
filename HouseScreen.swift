//
//  HouseScreen.swift
//  SpringInABoxGame
//
//  Created by catalina obando on 11/1/25.
//

import SwiftUI

struct HouseScreen: View {
    @State private var logoScale: CGFloat = 0.3
    @State private var logoOpacity = 0.0
    @State private var logoOffset: CGFloat = 100
    @State private var isAnimating = false  

    var body: some View {
        ZStack {
            Image("house_background") // Background image
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer().frame(maxHeight: 80)

                Image("logo") // Replace with your logo asset name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180) // adjust as needed
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                    .offset(y: logoOffset)
                    .onAppear {
                        withAnimation(.easeOut(duration: 1.5)) {
                            logoScale = 1.5
                            logoOpacity = 1.0
                            logoOffset = 0
                        }
                    }

                Spacer()

                Button(action: {
                    // TODO: Navigate to next screen
                }) {
                    Image("enter_button") // Replace with your button image
                        .resizable()
                        .frame(width: 200, height: 60)
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
    HouseScreen()
}
