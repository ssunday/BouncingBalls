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
    
    static func circleHasCollidedWithOtherCircle(circleFrame1: CGRect, circleFrame2: CGRect) -> Bool {
        return circleFrame1.intersects(circleFrame2)
    }
    
    static func circleOverLeftRightViewEdges(circleFrame: CGRect, viewFrame: CGRect) -> Bool{
        return circleFrameOverLeftEdge(circleFrame, viewFrame: viewFrame) || circleFrameOverRightEdge(circleFrame, viewFrame: viewFrame)
    }
    
    static func circleOverTopDownViewEdges(circleFrame: CGRect, viewFrame: CGRect) -> Bool{
        return circleFrameOverTopEdge(circleFrame, viewFrame: viewFrame) || circleFrameOverBottomEdge(circleFrame, viewFrame: viewFrame)
    }
    
    private static func circleFrameOverRightEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool{
        let rightEdgeOfcircleFrame = circleFrame.maxX
        let rightEdgeOfView = viewFrame.maxX
        return rightEdgeOfcircleFrame > rightEdgeOfView
    }
    
    
    private static func circleFrameOverLeftEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        let leftEdgeOfcircleFrame = circleFrame.minX
        let leftEdgeOfView = viewFrame.minX
        return leftEdgeOfcircleFrame < leftEdgeOfView
    }
    
    private static func circleFrameOverTopEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool{
        let topEdgeOfcircleFrame = circleFrame.minY
        let topEdgeOfView = viewFrame.minY
        return topEdgeOfcircleFrame < topEdgeOfView
    }
    
    private static func circleFrameOverBottomEdge(circleFrame: CGRect, viewFrame: CGRect) -> Bool {
        let buttomEdgeOfcircleFrame = circleFrame.maxY
        let buttomEdgeOfView = viewFrame.maxY
        return buttomEdgeOfcircleFrame > buttomEdgeOfView
    }
}