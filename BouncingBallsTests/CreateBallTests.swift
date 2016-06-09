//
//  CreateBallTests.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/8/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import XCTest
@testable import BouncingBalls

class CreateBallTests: XCTestCase {

    func testCreateNewBallClipsToBoundIsTrue() {
        XCTAssert(CreateBall.createNewBall(CGFloat(1000), viewHeight: CGFloat(950)).clipsToBounds)
    }

}
