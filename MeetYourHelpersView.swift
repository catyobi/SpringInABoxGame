//
//  MeetYourHelpersView.swift.swift
//  SpringInABoxGame
//
//  Created by Catalina Obando on 12/4/25.
//
import SwiftUI

struct Helper: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let isUnlocked: Bool
}

struct MeetYourHelpersView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Data
    
    private let helpers: [Helper] = [
        Helper(name: "Eclair",  imageName: "helper_eclair",  isUnlocked: true),
        Helper(name: "Brie",    imageName: "helper_brie",    isUnlocked: true),
        Helper(name: "Oliver",  imageName: "helper_oliver",  isUnlocked: true),
        Helper(name: "Brûlée",  imageName: "helper_brulee",  isUnlocked: false),
        Helper(name: "Mr. Stray", imageName: "helper_mr_stray", isUnlocked: false),
        Helper(name: "Gratin",  imageName: "helper_gratin",  isUnlocked: false),
        Helper(name: "Croque",  imageName: "helper_croque",  isUnlocked: false),
        Helper(name: "Sandra",  imageName: "helper_sandra",  isUnlocked: false),
        Helper(name: "Jacinto", imageName: "helper_jacinto", isUnlocked: false)
    ]
    
    // 3 columns grid
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    
    var body: some View {
        ZStack {
            // Background color similar to your beige screen
            Color(red: 0.99, green: 0.96, blue: 0.88)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                
                // Top bar with close "X"
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                            .padding(10)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 8)
                }
                
                // Title + subtitle
                VStack(spacing: 4) {
                    Text("Meet your\nHelpers")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                        .foregroundColor(Color(red: 0.21, green: 0.52, blue: 0.27))
                    
                    Text("Tap a helper to learn more.\nUnlock them as you grow!")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.top, 4)
                }
                .padding(.horizontal, 24)
                
                // Helpers grid
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(helpers) { helper in
                        HelperCircleView(helper: helper)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 8)
                
                Spacer()
                
                // Enter the Garden button
                Button {
                    // TODO: hook this up to your "Start Game" / navigate to garden
                    dismiss()
                } label: {
                    Image("button_enter_garden")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 260)
                        .shadow(radius: 4, y: 2)
                }
                .padding(.bottom, 32)
            }
        }
    }
}

// MARK: - Single Helper Circle

struct HelperCircleView: View {
    let helper: Helper
    
    var body: some View {
        VStack(spacing: 6) {
            ZStack(alignment: .bottomTrailing) {
                // Portrait circle
                Image(helper.imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.24, green: 0.39, blue: 0.16), lineWidth: 4)
                    )
                    .opacity(helper.isUnlocked ? 1.0 : 0.35)  // dim if locked
                
                // Lock icon
                if !helper.isUnlocked {
                    Image("lock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .padding(4)
                }
            }
            .frame(width: 90, height: 90)
            
            Text(helper.name)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 0.21, green: 0.52, blue: 0.27))
                .multilineTextAlignment(.center)
        }
    }
}

// MARK: - Preview

#Preview {
    MeetYourHelpersView()
}
