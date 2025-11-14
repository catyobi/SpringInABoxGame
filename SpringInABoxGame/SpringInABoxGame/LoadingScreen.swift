//
//  LoadingScreen.swift
//  SpringInABoxGame
//
//  Created by catalina obando on 11/1/25.
//

import SwiftUI

struct LoadingScreen: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // Background
            Image("RealLoading")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // FIXED POSITION CONTAINER
            VStack {
                Spacer()

                // FLOWER ROW WITH STABLE HEIGHT
                HStack(spacing: 12) {
                    ForEach(0..<3) { index in
                        Image("Flower")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .opacity(isAnimating ? 1 : 0.3)
                            .scaleEffect(isAnimating ? 1.2 : 1.0)
                            .animation(
                                Animation
                                    .easeInOut(duration: 0.8)
                                    .repeatForever()
                                    .delay(Double(index) * 0.3),
                                value: isAnimating
                            )
                    }
                }
                .frame(height: 60)         // << FREEZES VERTICAL SPACE
                .padding(.bottom, 240)     // << YOUR ORIGINAL POSITION
                
                Spacer().frame(height: 20)
            }
            // START ANIMATION HERE
            .onAppear {
                isAnimating = true
            }
        }
        .ignoresSafeArea()   // << ENSURES NO LAYOUT SHIFT FROM SAFE AREAS
    }
}

#Preview {
    LoadingScreen()
}
