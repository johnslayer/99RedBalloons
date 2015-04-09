//
//  ViewController.swift
//  99Balloons2
//
//  Created by Matt Grimes on 4/3/15.
//  Copyright (c) 2015 Daily Dram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonLabel: UILabel!
    @IBOutlet weak var balloonImage: UIImageView!
    
    var balloons:[Balloon] = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonButton(sender: UIBarButtonItem) {
        let balloon = balloons[currentIndex]
        balloonLabel.hidden = false
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.balloonImage.image = balloon.image
            self.balloonLabel.text = "\(balloon.number) Balloons"
            self.currentIndex += 1
            
            }, completion: {
                (finished: Bool) -> () in
        })
    }


    func createBalloons() {
        for var balloonCount = 0; balloonCount <= 99; ++balloonCount {
            var balloon = Balloon()
            balloon.number = balloonCount
            
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            switch randomNumber {
            case 1:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                balloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                balloon.image = UIImage(named: "RedBalloon4.jpg")
            }
        
            self.balloons.append(balloon)
        
        
        }
    }

}

