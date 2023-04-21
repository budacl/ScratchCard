//
//  ScratchCardCombineNetworkProviding.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import Combine

protocol ScratchCardCombineNetworkProviding {

    func activate(code: String) -> AnyPublisher<Bool, Error>

}
