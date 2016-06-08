//
//  CreateBall.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/8/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import Foundation
import UIKit

class CreateBall{
    
    static func createNewBall(viewFrame: CGRect) -> UIView{
        let size = CGFloat(Int(arc4random_uniform(80)+10))
        let xCoordinate = generateOriginCoordinate(size, viewFrameDimension: viewFrame.width)
        let yCoordinate = generateOriginCoordinate(size, viewFrameDimension: viewFrame.height)
        let newCircle = UIView(frame: CGRectMake(xCoordinate, yCoordinate, size, size))
        newCircle.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 50)
        newCircle.layer.cornerRadius = size/2
        newCircle.clipsToBounds = true
        return newCircle
    }
    
    private static func generateOriginCoordinate(size: CGFloat, viewFrameDimension: CGFloat) -> CGFloat {
        let randomPoint = Int(arc4random_uniform(UInt32(viewFrameDimension)))
        let coordinate = CGFloat(randomPoint) + size
        return coordinate
    }
}