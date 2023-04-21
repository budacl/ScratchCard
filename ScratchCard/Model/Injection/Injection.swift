//
//  Injection.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import Foundation

private struct ApiUrlsProviderKey: InjectionKey {
    static var currentValue: ApiUrlsProviding = ApiUrlsProvider()
}

private struct ScratchCardNetworkProviderKey: InjectionKey {
    static var currentValue: ScratchCardNetworkProviding = ScratchCardNetworkProvider()    
}

extension InjectedValues {
    
    var apiUrls: ApiUrlsProviding {
        get { Self[ApiUrlsProviderKey.self] }
        set { Self[ApiUrlsProviderKey.self] = newValue }
    }
    
    var scratchCardNetwork: ScratchCardNetworkProviding {
        get { Self[ScratchCardNetworkProviderKey.self] }
        set { Self[ScratchCardNetworkProviderKey.self] = newValue }
    }
    
}
