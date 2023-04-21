//
//  ScratchCardScreenView.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import SwiftUI

struct ScratchCardScreenView: View {
    
    @StateObject var scratchCard = ScratchCard.shared
    
    @State var isLoading: Bool = false
    
    @State private var task: Task<Void, Never>? = nil
    
    var body: some View {
        VStack {
            ScratchCardView()
                .padding(.bottom, 64)
            
            Button("action.scratch", action: {
                guard !isLoading else { return }
                task = Task {
                    isLoading = true
                    await scratchCard.scratch()
                    task = nil
                    isLoading = false
                }
            })
            .isLoading(isLoading)
            .buttonStyle(GrowingButton())
            .disabled(scratchCard.state != .unscratched)
        }
        .padding()
        .onDisappear {
            task?.cancel()
        }
    }
    
}

struct ScratchCardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScratchCardScreenView()
    }
}
