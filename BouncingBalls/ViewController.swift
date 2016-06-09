//
//  ViewController.swift
//  BouncingBalls
//
//  Created by Sarah Sunday on 6/7/16.
//  Copyright © 2016 Sarah Sunday. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var startSwitch: UISwitch!
    
    var timer = NSTimer()
    var activeCircles = [UIView]()
    var velocities = [[Int]]()
    
    @IBAction func changeCircleAmount(sender : AnyObject) {
        let currentStep = Int(stepper.value)
        let currentCircleAmount = activeCircles.count
        if (currentStep > currentCircleAmount){
            addCircle()
        }
        else if (currentStep < currentCircleAmount){
            removeCircle()
        }
    }
    
    @IBAction func startCircles(sender : AnyObject) {
        if startSwitch.on {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(ViewController.animateCircles), userInfo: nil, repeats: true)
        }
        else {
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func addCircle() -> Void{
        var newCircle = CreateBall.createNewBall(view.frame)
        while CollisionDetection.circleHasCollidedWithAnyActiveCircle(newCircle, activeCircles: activeCircles) {
            newCircle = CreateBall.createNewBall(view.frame)
        }
        let ballVelocities = BallVelocity.getRandomVelocities()
        velocities.append(ballVelocities)
        activeCircles.append(newCircle)
        view.addSubview(newCircle)
    }
    
    private func removeCircle() -> Void {
        let lastCircle = activeCircles.last
        activeCircles.popLast()
        lastCircle?.hidden = true
        view.willRemoveSubview(lastCircle!)
    }
    
    func animateCircles()-> Void {
        for i in 0..<activeCircles.count {
            let circle = activeCircles[i]
            animateCircle(circle, circleVelocities: &velocities[i])
        }
    }
    
    private func animateCircle(circle: UIView, inout circleVelocities: [Int]) -> Void {
        let circleFrame = circle.frame
        let originalViewFrame = view.frame
        let viewFrameWithoutToolbar = CGRect(x: originalViewFrame.origin.x, y: originalViewFrame.origin.y, width: originalViewFrame.width, height: originalViewFrame.height - 44)
        let trueView = UIView(frame: viewFrameWithoutToolbar)
        circleVelocities = BallVelocity.updateVelocities(circle, allCircles: activeCircles, view: trueView, currentVelocities: circleVelocities)
        UIView.animateWithDuration(0.1, animations: {
            var tempFrame = circleFrame
            tempFrame.origin.x = tempFrame.origin.x + CGFloat(circleVelocities[0])
            tempFrame.origin.y = tempFrame.origin.y + CGFloat(circleVelocities[1])
            circle.frame = tempFrame
        })
    }
    
}