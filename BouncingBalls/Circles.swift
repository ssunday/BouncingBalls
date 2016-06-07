//
//  Circles.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/7/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import Foundation
import UIKit


class Circles {
    
    static func circleHasCollidedWithOtherCircle(circle1: UIImageView, circle2: UIImageView) -> Bool {
        let circleBounds1 = circle1.bounds
        let circleBounds2 = circle2.bounds
        return circleBounds1.intersects(circleBounds2)
    }
    
    
    static func hasCircleHitEdge(circle: UIImageView, view: UIView) -> Bool{
        let circleBounds = circle.bounds
        return circleBounds.intersects(view.bounds)
    }
    
    static func circleOverRightEdge(circle: UIImageView, view: UIView) -> Bool{
        let circleFrame = circle.frame
        let viewFrame = view.frame
        let rightEdgeOfCircle = circleFrame.maxX
        let rightEdgeOfView = viewFrame.maxX
        return rightEdgeOfCircle > rightEdgeOfView
    }
    
    
    static func circleOverLeftEdge(circle: UIImageView, view: UIView) -> Bool {
        let circleFrame = circle.frame
        let viewFrame = view.frame
        let leftEdgeOfCircle = circleFrame.minX
        let leftEdgeOfView = viewFrame.minX
        return leftEdgeOfCircle < leftEdgeOfView
    }
    
    static func circleOverTopEdge(circle: UIImageView, view: UIView) -> Bool{
        let circleFrame = circle.frame
        let viewFrame = view.frame
        let topEdgeOfCircle = circleFrame.minY
        let topEdgeOfView = viewFrame.minY
        return topEdgeOfCircle < topEdgeOfView
    }
    
    static func circleOverBottomEdge(circle: UIImageView, view: UIView) -> Bool {
        let circleFrame = circle.frame
        let viewFrame = view.frame
        let buttomEdgeOfCircle = circleFrame.maxY
        let buttomEdgeOfView = viewFrame.maxY
        return buttomEdgeOfCircle > buttomEdgeOfView
    }
}