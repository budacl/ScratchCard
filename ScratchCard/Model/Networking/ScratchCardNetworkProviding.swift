//
//  ScratchCardNetworkProviding.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import Foundation

protocol ScratchCardNetworkProviding {
    
    func activate(code: String) async throws -> Bool
    
}
