//
//  CreateBallFactory.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/10/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import UIKit

class CreateBallFactory {
    
    var viewFrame = CGRect()
    
    init(viewFrame: CGRect){
        self.viewFrame = viewFrame
    }
    
    internal func generateBall(activeCircles: [UIView]) -> UIView {
        let viewWidth = viewFrame.width
        let viewHeight = viewFrame.height
        var newCircle = CreateBall.createNewBall(viewWidth, viewHeight: viewHeight)
        while ballInInvalidStartLocation(newCircle, activeCircles: activeCircles) {
            newCircle = CreateBall.createNewBall(viewWidth, viewHeight: viewHeight)
        }
        return newCircle
    }
    
    private func ballInInvalidStartLocation(circle: UIView, activeCircles: [UIView]) -> Bool {
        let overSideEdges = CollisionDetection.circleOverLeftRightViewEdges(circle.frame, viewFrame: viewFrame)
        let overTopDownEdges = CollisionDetection.circleOverTopDownViewEdges(circle.frame, viewFrame: viewFrame)
        let hittingCircles = CollisionDetection.circleHasCollidedWithAnyActiveCircle(circle, activeCircles: activeCircles)
        return (overSideEdges || overTopDownEdges || hittingCircles)
    }
    
}