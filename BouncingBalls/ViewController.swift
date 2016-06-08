//
//  ViewController.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/7/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var xVelocityBlack: CGFloat = 1.0
    var yVelocityBlack: CGFloat = -1.0
    
    @IBOutlet var circleBlack: UIImageView!
    
    @IBAction func startCircles(sender : AnyObject) {
        circleBlack.hidden = false
        _ = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.animateCircles), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleBlack.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func animateCircles()-> Void {
        let circleBlackFrame = circleBlack.frame
        let viewFrame = view.frame
        
        if CollisionDetection.circleOverLeftRightViewEdges(circleBlackFrame, viewFrame: viewFrame){
            xVelocityBlack *= -1
        }
        
        if CollisionDetection.circleOverTopDownViewEdges(circleBlackFrame, viewFrame: viewFrame){
            yVelocityBlack *= -1
        }
        
        UIView.animateWithDuration(0.1, animations: {
            var blackFrame = self.circleBlack.frame
            blackFrame.origin.y = blackFrame.origin.y + self.yVelocityBlack
            blackFrame.origin.x = blackFrame.origin.x + self.xVelocityBlack
            self.circleBlack.frame = blackFrame
        })
        
    }
    
}