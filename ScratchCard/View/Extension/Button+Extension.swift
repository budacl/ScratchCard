//
//  Button+Extension.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import SwiftUI

extension Button {
    
    func isLoading(_ isLoading: Bool) -> some View {
        overlay(
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .padding(.trailing, 16)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .opacity(isLoading ? 1 : 0)
        )
    }
}
