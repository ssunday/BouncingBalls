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
    
    static func circleHasCollidedWithOtherCircle(circleFrame1: CGRect, circleFrame2: CGRect) -> Bool {
        return circleFrame1.intersects(circleFrame2)
    }
    
    static func circleOverLeftRightViewEdges(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        return circleFrameOverLeftEdge(circleFrame, viewFrame: viewFrame) || circleFrameOverRightEdge(circleFrame, viewFrame: viewFrame)
    }
    
    static func circleOverTopDownViewEdges(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        return circleFrameOverTopEdge(circleFrame, viewFrame: viewFrame) || circleFrameOverBottomEdge(circleFrame, viewFrame: viewFrame)
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