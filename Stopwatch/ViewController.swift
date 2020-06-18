//
//  ViewController.swift
//  Stopwatch
//
//  Created by Matthew Cress on 5/11/20.
//  Copyright © 2020 Matthew Cress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var timer = Timer()
    var hours: Int = 0
    var minutes: Int = 0
    
    var seconds: Double = 00.00
    
    var timeElapsed: Int = 0
    
    
    @IBOutlet weak var clockLabel: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        //creates the timer and fires the timer when the start button is pressed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(displayClock), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        //pauses the timer when the pause button is pressed without resetting to zero
        timer.invalidate()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        //pauses and resets the timer to zero when the reset button is pressed
        timer.invalidate()
        
        hours = 00
        minutes = 00
        seconds = 00.00
        timeElapsed = 0
        clockLabel.text = "00:00:00"
    }
    
    
    @objc func displayClock() {
        
        timeElapsed += 1
        
        if timeElapsed < 6000 {
            seconds += 0.01
            // this section handles the display up to the one hour mark
            
            if timeElapsed < 1000, minutes < 10, hours == 0{
                clockLabel.text = "0\(minutes)" + " : 0" + String(format: "%0.2f", seconds)
                
            }else if timeElapsed < 1000, minutes > 9, hours == 0{
                clockLabel.text = "\(minutes)" + " : 0" + String(format: "%0.2f", seconds)
                
            }else if timeElapsed > 1000, minutes < 10, hours == 0{
                clockLabel.text = "0\(minutes)" + " : " + String(format: "%0.2f", seconds)
                
            }else if timeElapsed > 1000, minutes > 9, hours == 0{
                clockLabel.text = "\(minutes)" + " : " + String(format: "%0.2f", seconds)
                
            //The next section handles the display past the one hour mark but before the ten hour mark
                
            }else if timeElapsed < 1000, minutes < 10, hours < 10 {
                clockLabel.text = "0\(hours)" + " : " + "0\(minutes)" + " : 0" + String(format: "%0.2f", seconds)
                
            }else if timeElapsed < 1000, minutes > 9, hours < 10 {
                clockLabel.text = "0\(hours)" + " : " + "\(minutes)" + " : 0" + String(format: "%0.2f", seconds)
                
            }else if timeElapsed > 1000, minutes < 10, hours < 10 {
                clockLabel.text = "0\(hours)" + " : " + "0\(minutes)" + " : " + String(format: "%0.2f", seconds)
                
            }else if timeElapsed > 1000, minutes > 9, hours < 10 {
                clockLabel.text = "0\(hours)" + " : " + "\(minutes)" + " : " + String(format: "%0.2f", seconds)
                
            //The next section handles the display past the ten hour mark
                
            }else if timeElapsed < 1000, minutes < 10, hours > 9 {
                clockLabel.text = "\(hours)" + " : " + "0\(minutes)" + " : 0" + String(format: "%0.2f", seconds)
                
            }else if timeElapsed < 1000, minutes > 9, hours > 9 {
                clockLabel.text = "\(hours)" + " : " + "\(minutes)" + " : 0" + String(format: "%0.2f", seconds)
                
            }else if timeElapsed > 1000, minutes < 10, hours > 9 {
                clockLabel.text = "\(hours)" + " : " + "0\(minutes)" + " : " + String(format: "%0.2f", seconds)
                
            }else if timeElapsed > 1000, minutes > 9, hours > 9 {
                clockLabel.text = "\(hours)" + " : " + "\(minutes)" + " : " + String(format: "%0.2f", seconds)
            }
            
            
            
        }else{
            minutes += 1
            seconds = 0.0
            timeElapsed = 0
            
            if minutes < 10{
                clockLabel.text = "0\(minutes)" + " : " + "\(seconds)"
            }else if minutes < 60{
                clockLabel.text = "\(minutes)" + " : " + "\(seconds)"
            }else{
                hours += 1
                minutes = 0
                if hours < 10{
                    clockLabel.text = "0\(hours)" + " : " + "\(minutes)" + " : " + String(format: "%0.2f", seconds)
                }else{
                    clockLabel.text = "\(hours)" + " : " + "\(minutes)" + " : " + String(format: "%0.2f", seconds)
                }
               
            }
            
        }
        
    }
    
}

