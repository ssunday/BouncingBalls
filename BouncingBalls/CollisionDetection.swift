//
//  CollisionDetection.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/7/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import Foundation
import UIKit

class CollisionDetection {
    
    static func circleHasCollidedWithAnyActiveCircle(circle: UIView, activeCircles: [UIView]) -> Bool {
        var hasCollided = false
        hasCollided = false
        for aCircle in activeCircles {
            if aCircle !== circle && circleHasCollidedWithOtherCircle(aCircle.frame, circleFrame2: circle.frame){
                hasCollided = true
            }
        }
        return hasCollided
    }
    
    static func circleOverLeftRightViewEdges(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        return circleFrameOverLeftEdge(circleFrame, viewFrame: viewFrame) || circleFrameOverRightEdge(circleFrame, viewFrame: viewFrame)
    }
    
    static func circleOverTopDownViewEdges(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        return circleFrameOverTopEdge(circleFrame, viewFrame: viewFrame) || circleFrameOverBottomEdge(circleFrame, viewFrame: viewFrame)
    }
    
    private static func circleHasCollidedWithOtherCircle(circleFrame1: CGRect, circleFrame2: CGRect) -> Bool {
        let e: CGFloat = 0.5
        let distanceDifferential = getDistanceDifferential(circleFrame1, circleFrame2: circleFrame2)
        return distanceDifferential < e
    }
    
    private static func getDistanceDifferential(circleFrame1: CGRect, circleFrame2: CGRect) -> CGFloat {
        let sumOfRadii = getSumOfRadii(circleFrame1, circleFrame2: circleFrame2)
        let distance = getDistanceBetweenOrigins(circleFrame1, circleFrame2: circleFrame2)
        let distanceDifferential = distance - sumOfRadii
        return distanceDifferential
    }
    
    private static func getSumOfRadii(circleFrame1: CGRect, circleFrame2: CGRect) -> CGFloat {
        let radii1 = circleFrame1.height/2.0
        let radii2 = circleFrame2.height/2.0
        let sumOfRadii = radii1 + radii2
        return sumOfRadii
    }
    
    private static func getDistanceBetweenOrigins(circleFrame1: CGRect, circleFrame2: CGRect) -> CGFloat {
        let circle1Origin = circleFrame1.origin
        let circle2Origin = circleFrame2.origin
        let xDist = (circle2Origin.x - circle1Origin.x)
        let yDist = (circle2Origin.y - circle1Origin.y)
        let distanceBetweenOrigins = sqrt((xDist * xDist) + (yDist * yDist))
        return distanceBetweenOrigins
    }
    
    private static func circleFrameOverRightEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        let rightEdgeOfcircleFrame = circleFrame.maxX
        let rightEdgeOfView = viewFrame.maxX - 5
        return rightEdgeOfcircleFrame > rightEdgeOfView
    }
    
    private static func circleFrameOverLeftEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        let leftEdgeOfcircleFrame = circleFrame.minX
        let leftEdgeOfView = viewFrame.minX + 5
        return leftEdgeOfcircleFrame < leftEdgeOfView
    }
    
    private static func circleFrameOverTopEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        let topEdgeOfcircleFrame = circleFrame.minY
        let topEdgeOfView = viewFrame.minY + 5
        return topEdgeOfcircleFrame < topEdgeOfView
    }
    
    private static func circleFrameOverBottomEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        let bottomEdgeOfcircleFrame = circleFrame.maxY
        let bottomEdgeOfView = viewFrame.maxY - 5
        return bottomEdgeOfcircleFrame > bottomEdgeOfView
    }
    
}