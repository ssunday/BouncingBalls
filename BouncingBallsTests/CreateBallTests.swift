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
        let viewFrame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        XCTAssert(CreateBall.createNewBall(viewFrame).clipsToBounds)
    }

}
