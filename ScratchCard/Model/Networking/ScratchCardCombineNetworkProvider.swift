//
//  ScratchCardCombineNetworkProvider.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import Foundation
import Combine

struct ScratchCardCombineNetworkProvider: ScratchCardCombineNetworkProviding {

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

    func activate(code: String) -> AnyPublisher<Bool, Error> {
        guard let url = URL(string: urlProvider.apiUrls.scratchCard)?.appending("code", value: code) else {
            return Fail(error: ApiError.invalidUrl).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
              .map(\.data)
              .decode(type: ActivateResult.self, decoder: JSONDecoder())
              .map(\.isValid)
              .eraseToAnyPublisher()
    }

}
