//
//  ViewController.swift
//  imagedetector 
//
//  Created by shohei on 7/12/16.
//  Copyright © 2016 shohei. All rights reserved.
//

import Cocoa
import Darwin

class ViewController: NSViewController {
    @IBOutlet weak var trackLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        self.view.window?.opaque = false
        self.view.window?.backgroundColor = NSColor.clearColor()
        //        self.view.window?.titlebarAppearsTransparent = true
        self.view.window?.movableByWindowBackground = true
        
//        self.view.window?.level = Int(CGWindowLevelForKey(kCGFloatingWindowLevelKey))
        self.view.window!.level = Int(CGWindowLevelForKey(.FloatingWindowLevelKey))
        self.view.window!.level =  Int(CGWindowLevelForKey(.MaximumWindowLevelKey))
        
        startMoveLabel()
    }
    
    func startMoveLabel(){
        var delayTime = 0.1
        for num in 1...10000 {
            delayTime = delayTime + 0.1
            self.delay(Double(delayTime)){
                let theta = Double(num)*6/(2*M_PI)
                let r = 100.0
                let x0 = 100.0
                let y0 = 100.0
                let x = r*cos(theta)+x0
                let y = r*sin(theta)+y0
                self.trackLabel.frame = CGRectMake(CGFloat(x),CGFloat(y), 60, 40)
            }
        }
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}

