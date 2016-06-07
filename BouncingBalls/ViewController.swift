//
//  ViewController.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/7/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var horizontalVelocityBlack: CGFloat = 1.0
    var verticalVelocityBlack: CGFloat = -1.0
    
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
        
        if Circles.circleOverRightEdge(circleBlack, view: view) || Circles.circleOverLeftEdge(circleBlack, view: view){
            horizontalVelocityBlack *= -1
        }
        
        if Circles.circleOverTopEdge(circleBlack, view: view) || Circles.circleOverBottomEdge(circleBlack, view: view){
            verticalVelocityBlack *= -1
        }
        
        UIView.animateWithDuration(0.1, animations: {
            var blackFrame = self.circleBlack.frame
            blackFrame.origin.y = blackFrame.origin.y + self.verticalVelocityBlack
            blackFrame.origin.x = blackFrame.origin.x + self.horizontalVelocityBlack
            self.circleBlack.frame = blackFrame
        })
        
    }
    
}