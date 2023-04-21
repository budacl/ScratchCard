//
//  ContentView.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject var scratchCard = ScratchCard.shared
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScratchCardView().padding(.bottom, 64)
                
                NavigationLink("action.scratch") {
                    ScratchCardScreenView()
                }                
                .padding(.bottom, 8)
                .buttonStyle(GrowingButton())
                .disabled(scratchCard.state != .unscratched)
                
                NavigationLink("action.activate") {
                    ActivateCardScreenView()
                }
                .padding(.bottom, 8)
                .buttonStyle(GrowingButton())
                .disabled(scratchCard.state != .scratched)
                
                Button("action.reset") {
                    scratchCard.reset()
                }
                .disabled(scratchCard.state == .unscratched)
                .buttonStyle(GrowingButton())
                
                
            }
            .padding()
            .navigationTitle("main.header")
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
