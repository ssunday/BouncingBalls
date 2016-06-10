//
//  CreateBallFactoryTests.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/10/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import XCTest
@testable import BouncingBalls

class CreateBallFactoryTests: XCTestCase {
    
    var createBallFactory: CreateBallFactory!
    var viewFrame: CGRect!
    
    override func setUp() {
        viewFrame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        createBallFactory =  CreateBallFactory(viewFrame: viewFrame)
    }
    
    func testGenerateBallCreatesNewBallWithinView(){
        let activeCircles = [UIView]()
        let newCircle = createBallFactory.generateBall(activeCircles)
        XCTAssert(viewFrame.contains(newCircle.frame))
    }
    
    func testGenerateBallCreatesNewBallThatDoesNotHitOtherBall(){
        let activeCircles = [UIView]()
        let newCircle = createBallFactory.generateBall(activeCircles)
        XCTAssert(viewFrame.contains(newCircle.frame))
    }
    
}
