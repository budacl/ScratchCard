//
//  ScratchCardNetworkProvider.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import Foundation

struct ScratchCardNetworkProvider: ScratchCardNetworkProviding {
    
    @Injected(\.apiUrls) var urlProvider: ApiUrlsProviding
    
    struct ActivateResult: Decodable {
        
        let ios: String
        
        private static let minimumSupportedVersion = 6.1
        
        var isValid: Bool {
            guard let ios = Double(ios) else {
                return false
            }
            return ios > Self.minimumSupportedVersion
        }
    }
    
    func activate(code: String) async throws -> Bool {
        guard let url = URL(string: urlProvider.apiUrls.scratchCard)?.appending("code", value: code) else {
            throw ApiError.invalidUrl
        }
            
        let (data, _) = try await URLSession.shared.data(from: url)
        let r = try JSONDecoder().decode(ActivateResult.self, from: data)
        return r.isValid
    }
    
}
