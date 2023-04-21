//
//  ScratchCard.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import Foundation
import UserNotifications

class ScratchCard: ObservableObject {
    
    enum State {
        case unscratched, scratched, active
    }
    
    static private(set) var shared = ScratchCard()
    
    
    let id: String = UUID().uuidString
    @Published var state: State = .unscratched
    @Injected(\.scratchCardNetwork) var networkProvider: ScratchCardNetworkProviding
    
    func scratch() async {
        guard state == .unscratched else { return }
        
        let seconds = 2
        let oneSecondInNs = UInt64(1_000_000_000)
        do {
            for _ in 1...seconds {
                try Task.checkCancellation()                
                try await Task.sleep(nanoseconds: oneSecondInNs)
            }
            
            await MainActor.run {
                state = .scratched
            }
        } catch {
            print(error)
        }
    }
    
    @discardableResult
    func activate() async throws -> Bool {
        guard state == .scratched else { return false }
        
        let isActive = try await networkProvider.activate(code: id)
        
        await MainActor.run {
            if isActive {
                state = .active
            } else {
                onUnsupportedVersion()
            }
        }
        
        return isActive
    }
    
    func reset() {
        state = .unscratched
    }
    
    private func onUnsupportedVersion() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                let content = UNMutableNotificationContent()
                content.body = String(localized: "error.activation")
                content.sound = UNNotificationSound.default
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
                UNUserNotificationCenter.current().add(request)
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
