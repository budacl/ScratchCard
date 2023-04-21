//
//  ScratchCardView.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import SwiftUI

struct ScratchCardView: View {
    
    @StateObject var scratchCard = ScratchCard.shared
    
    var body: some View {
        VStack {
            Text(scratchCard.id)
                .frame(maxWidth: .infinity, maxHeight: 128)
                .padding(16)
                .font(Font.system(size: 15))
                .overlay {
                    Color.gray
                        .cornerRadius(8)
                        .opacity(scratchCard.state == .unscratched ? 1 : 0)
                        .animation(.easeInOut(duration: 1.0), value: scratchCard.state)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(scratchCard.state == .active ? .green : .gray, lineWidth: 1)
                )
        }
    }
}
