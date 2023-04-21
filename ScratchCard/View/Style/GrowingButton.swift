//
//  GrowingButton.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.green, Color.blue]),
                    startPoint: .leading,
                    endPoint: .trailing
                ).opacity(isEnabled ? 1 : 0.3)
            )
            .foregroundColor(.white)
            .fontWeight(.medium)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
}
