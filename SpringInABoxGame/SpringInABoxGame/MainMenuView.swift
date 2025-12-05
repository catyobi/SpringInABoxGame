//
//  MainMenuView.swift
//  SpringInABoxGame
//
//  Created by catalina obando on 11/1/25.
//
import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("MainMenu")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 20) {

                    Spacer()

                    // HOW TO PLAY — the only real screen you have right now
                    NavigationLink(destination: HowToPlayScreen()) {
                        Image("HowToPlay")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }

                    // OTHER BUTTONS — show them, but go to placeholder screens
                    NavigationLink(destination: ComingSoonScreen(title: "Meet Your Helpers")) {
                        Image("MeetYourHelpers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }

                    NavigationLink(destination: ComingSoonScreen(title: "Start Game")) {
                        Image("StartGame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }

                    NavigationLink(destination: ComingSoonScreen(title: "Continue")) {
                        Image("Continue")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }

                    NavigationLink(destination: ComingSoonScreen(title: "Settings")) {
                        Image("Settings")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }

                    NavigationLink(destination: ComingSoonScreen(title: "Thanks")) {
                        Image("Thanks")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                    }

                    Spacer()
                }
                .padding()
            }
        }
    }
}
struct ComingSoonScreen: View {
    let title: String

    var body: some View {
        VStack {
            Text("\(title) Coming Soon")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    MainMenuView()
}
