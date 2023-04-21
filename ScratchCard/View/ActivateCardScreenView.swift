//
//  ActivateCardScreenView.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import SwiftUI

struct ActivateCardScreenView: View {
    
    @StateObject var scratchCard = ScratchCard.shared
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            ScratchCardView().padding(.bottom, 64)
            
            Button("action.activate", action: {
                guard !isLoading else { return }
                Task {
                    isLoading = true
                    try await scratchCard.activate()
                    isLoading = false
                }
            })
            .isLoading(isLoading)
            .buttonStyle(GrowingButton())
            .disabled(scratchCard.state != .scratched)
            
        }
        .padding()
    }
}

struct ActivateCardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ActivateCardScreenView()
    }
}
