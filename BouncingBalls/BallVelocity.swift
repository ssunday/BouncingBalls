//
//  BallVelocity.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/8/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import Foundation
import UIKit

class BallVelocity {
    
    static func getRandomVelocities() -> [Int]{
        let xVelocity = getRandomVel()
        let yVelocity = getRandomVel()
        return [xVelocity, yVelocity]
    }
    
    static func updateVelocities(circle: UIView, allCircles: [UIView], view: UIView, currentVelocities: [Int]) -> [Int] {
        let circleFrame = circle.frame
        let viewFrame = view.frame
        var newVelocities = currentVelocities
        if CollisionDetection.circleOverLeftRightViewEdges(circleFrame, viewFrame: viewFrame){
            newVelocities[0] *= -1
        }
        
        if CollisionDetection.circleOverTopDownViewEdges(circleFrame, viewFrame: viewFrame){
            newVelocities[1] *= -1
        }
        
        for aCircle in allCircles {
            let aCircleFrame = aCircle.frame
            if aCircle !== circle && CollisionDetection.circleHasCollidedWithOtherCircle(circleFrame, circleFrame2: aCircleFrame){
                newVelocities[0] *= -1
                newVelocities[1] *= -1
            }
        }
        
        return newVelocities
    }
    
    private static func getRandomVel() -> Int {
        var randomVel = Int(arc4random_uniform(6)) - 3
        while randomVel == 0 {
            randomVel = Int(arc4random_uniform(6)) - 3
        }
        return randomVel
    }
    
}