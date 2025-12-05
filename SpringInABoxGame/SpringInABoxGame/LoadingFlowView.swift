//
//  LoadingFlowView.swift
//  SpringInABoxGame
//
//  Created by catalina obando on 11/13/25.
//
import SwiftUI

struct LoadingFlowView: View {
    @State private var goToHouse = false

    var body: some View {
        ZStack {
            LoadingScreen()   // your animation ONLY

            NavigationLink(
                destination: HouseScreen(),
                isActive: $goToHouse
            ) {
                EmptyView()
            }
            .hidden()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                goToHouse = true
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        LoadingFlowView()
    }
}
