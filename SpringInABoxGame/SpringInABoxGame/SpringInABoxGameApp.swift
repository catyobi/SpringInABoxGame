//
//  SpringInABoxGameApp.swift
//  SpringInABoxGame
//
//  Created by catalina obando on 11/1/25.
//

import SwiftUI

import SwiftUI

@main
struct SpringInABoxGameApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoadingFlowView()   // << MUST BE THIS, not LoadingScreen
            }
        }
    }
}
