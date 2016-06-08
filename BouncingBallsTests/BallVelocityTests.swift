//
//  BallVelocityTests.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/8/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import XCTest
@testable import BouncingBalls

class BallVelocityTests: XCTestCase {
    
    func testUpdateVelocitiesReturnsSameVelocityIfNotCollidingWithViewEdgeOrCircle(){
        let circle = UIView(frame: CGRect(x: 20, y: 20, width: 1, height: 1))
        let allCircles = [circle]
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
        let currentVelocities = [1,1]
        XCTAssertEqual(BallVelocity.updateVelocities(circle, allCircles: allCircles, view: view, currentVelocities: currentVelocities), currentVelocities)
    }
    
    func testUpdateVelocitiesReturnsInvertedVelocityIfHittingOtherCircle(){
        let circle = UIView(frame: CGRect(x: 20, y: 20, width: 1, height: 1))
        let otherCircle = UIView(frame: CGRect(x: 19, y: 19, width: 2, height: 1))
        let allCircles = [circle, otherCircle]
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 1, height: 1))
        let currentVelocities = [1,1]
        XCTAssertEqual(BallVelocity.updateVelocities(circle, allCircles: allCircles, view: view, currentVelocities: currentVelocities), [-1,-1])
    }
    
    func testUpdateVelocitiesReturnsXInvertedWhenHittingViewSideEdges(){
        let circle = UIView(frame: CGRect(x: 10, y: 40, width: 20, height: 40))
        let allCircles = [circle]
        let view = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: 100))
        let currentVelocities = [1,1]
        XCTAssertEqual(BallVelocity.updateVelocities(circle, allCircles: allCircles, view: view, currentVelocities: currentVelocities), [-1,1])
    }
    
    func testUpdateVelocitiesReturnsYInvertedWhenHittingViewSideEdges(){
        let circle = UIView(frame: CGRect(x: 40, y: 10, width: 40, height: 20))
        let allCircles = [circle]
        let view = UIView(frame: CGRect(x: 10, y: 0, width: 100, height: 10))
        let currentVelocities = [1,1]
        let newVelocities = BallVelocity.updateVelocities(circle, allCircles: allCircles, view: view, currentVelocities: currentVelocities)
        XCTAssertEqual(newVelocities, [1,-1])
    }
    
    func testGetRandomVelocitiesReturnsVelocitiesLessThan10(){
        let randomVel = BallVelocity.getRandomVelocities()
        XCTAssert(randomVel[0] < 10 && randomVel[1] < 10)
    }
    
    func testGetRandomVelocitiesReturnsVelocitiesGreaterThanNegative10(){
        let randomVel = BallVelocity.getRandomVelocities()
        XCTAssert(randomVel[0] > -10 && randomVel[1] > -10)
    }
}
