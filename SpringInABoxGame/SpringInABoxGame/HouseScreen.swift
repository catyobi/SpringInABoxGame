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
            
            // FIXED BACKGROUND BEHAVIOR
            Image("house_background")
                .resizable()
                .scaledToFit()   // << FIX
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .ignoresSafeArea()

            VStack {

                Spacer().frame(height: UIScreen.main.bounds.height * 0.13)

                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
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

                NavigationLink(destination: MainMenuView()) {
                    Image("enter_button")
                        .resizable()
                        .frame(width: 200, height: 60)
                }
                .padding(.bottom, 5)
            }
            // RESPONSIVE POSITION FIX
            .offset(y: -UIScreen.main.bounds.height * 0.035)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HouseScreen()
}
