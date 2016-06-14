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
    @IBOutlet var speedSlider: UISlider!
    
    let bottomBarHeight = CGFloat(50);
    let topBarHeight = CGFloat(65);
    
    var createBallFactory: CreateBallFactory!
    var trueView: UIView!
    var timer = NSTimer()
    var activeCircles = [UIView]()
    var velocities = [[Int]]()
    
    @IBAction func getAppInfo(sender : AnyObject){
        let messageContent = "Add balls with the +/- buttons, speed up and slow down with the slider and start/stop animating with the switch."
        let alertController = UIAlertController(title: "Bouncing Balls Instructions", message:
            messageContent, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
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
        trueView = trueViewFrame()
        createBallFactory = CreateBallFactory(viewFrame: trueView.frame)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func addCircle() -> Void{
        let newCircle = createBallFactory.generateBall(activeCircles)
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
        let speedFactor = getSpeedFactor();
        let circleFrame = circle.frame
        circleVelocities = BallVelocity.updateVelocities(circle, allCircles: activeCircles, view: trueView, currentVelocities: circleVelocities)
        UIView.animateWithDuration(0.01, animations: {
            var tempFrame = circleFrame
            tempFrame.origin.x = tempFrame.origin.x + CGFloat(Float(circleVelocities[0]) * speedFactor)
            tempFrame.origin.y = tempFrame.origin.y + CGFloat(Float(circleVelocities[1]) * speedFactor)
            circle.frame = tempFrame
        })
    }
    
    private func trueViewFrame() -> UIView {
        let originalViewFrame = view.frame
        let viewFrameWithoutBars = CGRect(x: originalViewFrame.origin.x, y: originalViewFrame.origin.y + topBarHeight, width: originalViewFrame.width, height: originalViewFrame.height - (bottomBarHeight + topBarHeight))
        let trueView = UIView(frame: viewFrameWithoutBars)
        return trueView
    }
    
    private func getSpeedFactor() -> Float {
        return speedSlider.value
    }
    
}