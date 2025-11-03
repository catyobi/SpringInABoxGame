//
//  MainMenuView.swift
//  SpringInABoxGame
//
//  Created by catalina obando on 11/1/25.
//

import SwiftUI

import SwiftUI

struct AnimatedMenuButton: View {
    let imageName: String
    let action: () -> Void
    
    @State private var isPressed = false

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.1)) {
                isPressed = true
            }
            // Delay resetting the press so the animation shows
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
                action()
            }
        }) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .scaleEffect(isPressed ? 0.95 : 1.0) // Slight shrink
        }
    }
}
struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 10)
            .background(
                Color.clear
            )
            
            
    }
}

struct MainMenuView: View {
    var body: some View {
        ZStack {
            // 🌄 Background Image
            Image("MainMenu")  // Replace with your image name
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // 📋 Menu Buttons VStack
            VStack(spacing: 1) {
                Spacer()

                // 💡 Menu Buttons
                AnimatedMenuButton(imageName: "HowToPlay") {
                    // TODO: Navigate to next screen
                
                }
                .buttonStyle(MenuButtonStyle())

                AnimatedMenuButton(imageName: "MeetYourHelpers") {
                    // TODO: Navigate to next screen
                
                }
                .buttonStyle(MenuButtonStyle())

                AnimatedMenuButton(imageName: "StartGame") {
                    // TODO: Navigate to next screen
                
                }
                .buttonStyle(MenuButtonStyle())

                AnimatedMenuButton(imageName: "Continue") {
                    // TODO: Navigate to next screen
                
                }
                .buttonStyle(MenuButtonStyle())

                AnimatedMenuButton(imageName: "Settings") {
                    // TODO: Navigate to next screen
                
                }
                .buttonStyle(MenuButtonStyle())

                AnimatedMenuButton(imageName: "Thanks") {
                    // TODO: Navigate to next screen
                
                }
                .buttonStyle(MenuButtonStyle())


                Spacer()
            }
            .padding()
        }
    }
}


    
#Preview {
    MainMenuView()
}
