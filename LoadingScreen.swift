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
            // Your background image
            Image("RealLoading") // replace with your real image name
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Optional: Animated dots or icon at the bottom
            VStack {
                Spacer()

                // Animated row of three flowers
                HStack(spacing: 12) {
                    ForEach(0..<3) { index in
                        Image("Flower") // replace with your actual image name
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
                .padding(.bottom, 280) // adjust vertical position as needed

                Spacer().frame(height: 20)
            }
            .onAppear {
                isAnimating = true
            }
            }
        }
    }
    #Preview {
        LoadingScreen()
    }

