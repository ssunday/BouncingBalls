//
//  CreateBall.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/8/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import Foundation
import UIKit

class CreateBall {
    
    static func createNewBall(viewFrame: CGRect) -> UIView{
        let size = CGFloat(Int(arc4random_uniform(80)+10))
        let xCoordinate = generateOriginCoordinate(size, viewFrameDimension: viewFrame.width)
        let yCoordinate = generateOriginCoordinate(size, viewFrameDimension: viewFrame.height)
        let newCircle = UIView(frame: CGRectMake(xCoordinate, yCoordinate, size, size))
        newCircle.backgroundColor = randomColor()
        newCircle.layer.cornerRadius = size/2
        newCircle.clipsToBounds = true
        return newCircle
    }
    
    private static func generateOriginCoordinate(size: CGFloat, viewFrameDimension: CGFloat) -> CGFloat {
        var coordinate = randCoordinate(size, viewFrameDimension: viewFrameDimension)
        while coordinate > viewFrameDimension {
            coordinate = randCoordinate(size, viewFrameDimension: viewFrameDimension)
        }
        return coordinate
    }
    
    private static func randCoordinate(size: CGFloat, viewFrameDimension: CGFloat) -> CGFloat {
        let randomPoint = Int(arc4random_uniform(UInt32(viewFrameDimension - size*2)))
        let coordinate = CGFloat(randomPoint) + size/2
        return coordinate
    }
    
    private static func randomColor() -> UIColor{
        return UIColor(red: randRGBVal(), green: randRGBVal(), blue: randRGBVal(), alpha: 50)
    }
    
    private static func randRGBVal() -> CGFloat{
        let rawVal = Float(arc4random_uniform(255))
        let floatVal = CGFloat(rawVal/255.0)
        return floatVal
    }
}