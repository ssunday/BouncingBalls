//
//  CollisionDetectionTests.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/8/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import XCTest

@testable import BouncingBalls

class CollisionDetectionTests: XCTestCase {
    
    func testCirclOverLeftRightViewEdgesReturnsFalseWhenInsideViewBounds() {
        let circle = CGRect(x: 20, y: 20, width: 1, height: 1)
        let view = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        XCTAssertFalse(CollisionDetection.circleOverLeftRightViewEdges(circle, viewFrame: view))
    }
    
    func testCirclOverTopDownViewEdgesReturnsFalseWhenInsideViewBounds() {
        let circle = CGRect(x: 20, y: 20, width: 1, height: 1)
        let view = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        XCTAssertFalse(CollisionDetection.circleOverTopDownViewEdges(circle, viewFrame: view))
    }
    
    func testCirclOverTopDownViewEdgesReturnsTrueWhenOutsideViewBounds() {
        let circle = CGRect(x: 10, y: 0, width: 40, height: 40)
        let view = CGRect(x: 10, y: 10, width: 100, height: 10)
        XCTAssert(CollisionDetection.circleOverTopDownViewEdges(circle, viewFrame: view))
    }
    
    func testCirclOverLeftRightViewEdgesReturnsTrueWhenOutsideViewBounds() {
        let circle = CGRect(x: 10, y: 40, width: 20, height: 40)
        let view = CGRect(x: 0, y: 10, width: 10, height: 100)
        XCTAssert(CollisionDetection.circleOverLeftRightViewEdges(circle, viewFrame: view))
    }
    
    
    func testCircleHasCollidedWithOtherCircleReturnsTrueWhenIntersecting() {
        let circle1 = CGRect(x: 30, y: 30, width: 50, height: 40)
        let circle2 = CGRect(x: 0, y: 10, width: 40, height: 100)
        XCTAssert(CollisionDetection.circleHasCollidedWithOtherCircle(circle1, circleFrame2: circle2))
    }
    
    func testCircleHasCollidedWithOtherCircleReturnsFalseWhenNotIntersecting() {
        let circle1 = CGRect(x: 50, y: 60, width: 10, height: 10)
        let circle2 = CGRect(x: 0, y: 0, width: 10, height: 10)
        XCTAssertFalse(CollisionDetection.circleHasCollidedWithOtherCircle(circle1, circleFrame2: circle2))
    }
    
    func testCircleHasCollidedWithAnyActiveCircleReturnsFalseWhenNotIntersecting() {
        let circle1 = UIView(frame: CGRect(x: 50, y: 60, width: 10, height: 10))
        let circle2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let circles = [circle2, circle1]
        XCTAssertFalse(CollisionDetection.circleHasCollidedWithAnyActiveCircle(circle1, activeCircles: circles))
    }
    
    func testCircleHasCollidedWithAnyActiveCircleReturnsTrueWhenIntersecting() {
        let circle1 = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 40))
        let circle2 = UIView(frame: CGRect(x: 0, y: 10, width: 40, height: 100))
        let circles = [circle2, circle1]
        XCTAssert(CollisionDetection.circleHasCollidedWithAnyActiveCircle(circle1, activeCircles: circles))
    }
    
}
