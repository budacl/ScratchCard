//
//  ScratchCardTests.swift
//  ScratchCardTests
//
//  Created by Lukas Budac on 21/04/2023.
//

import XCTest
@testable import ScratchCard

class ScratchCardTests: XCTestCase {
    
    private var scratchCard = ScratchCard()

    override class func setUp() {
//        InjectedValues[\.scratchCardNetwork] = .. inject if needed
    }
    
    func testCorrectOrder() async {
        
        XCTAssertTrue(scratchCard.state == .unscratched)
        
        await scratchCard.scratch()
        
        XCTAssertTrue(scratchCard.state == .scratched)
        
        do {
            let didActivate = try await scratchCard.activate()
            XCTAssertTrue(didActivate && scratchCard.state == .active || scratchCard.state == .scratched)
        } catch {
            XCTAssertTrue(scratchCard.state == .scratched)
        }
    }
    
    func testIncorrectOrder() async {
        XCTAssertTrue(scratchCard.state == .unscratched)
                
        do {
            try await scratchCard.activate()
            XCTAssertTrue(scratchCard.state == .unscratched)
        } catch {
            XCTAssertTrue(scratchCard.state == .unscratched)
        }
    }
    
    func testReset() {
        scratchCard.reset()
        XCTAssertTrue(scratchCard.state == .unscratched)
    }

}
