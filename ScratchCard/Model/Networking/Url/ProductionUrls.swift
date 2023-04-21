//
//  ProductionUrls.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import Foundation

struct ProductionUrls: ApiUrls {
    
    private static let base: String = "https://api.o2.sk/"
    
    let scratchCard = base + "version"
    
}
