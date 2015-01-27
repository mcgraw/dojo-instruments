//
//  XMCTimeProfile.swift
//  instruments
//
//  Created by David McGraw on 1/26/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCTimeProfile: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    
    var numberList = [Int]()
    var sessionQueue = dispatch_queue_create("session", DISPATCH_QUEUE_SERIAL)

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        status.text = "Generating random numbers"

        sessionStep { (message) -> Void in
            self.status.text = message
        }
        
    }
    
    func sessionStep(status: (message: String) -> Void) {
        dispatch_async(sessionQueue, {
            
            self.generateRandomNumbers(500)
            
            dispatch_async(dispatch_get_main_queue(), {
                status(message: "Insertion Sort")
            })
            
            self.insertionSort()

            dispatch_async(dispatch_get_main_queue(), {
                status(message: "Done. Generating new numbers")
            })
            
            self.generateRandomNumbers(500)

            dispatch_async(dispatch_get_main_queue(), {
                status(message: "Bubble Sort")
            })
            
            self.bubbleSort()
        
            dispatch_async(dispatch_get_main_queue(), {
                status(message: "Done")
            })
        })
    }
    
    func generateRandomNumbers(total: Int) {
        for var i = 0; i < total; i++ {
            let rand = Int(arc4random() % 100000)
            numberList.append(rand)
        }
    }
    
    /* Reference: http://waynewbishop.com/swift/sorting-algorithms/
     */
    func insertionSort() {
        var x, y, key: Int
        
        for (x = 0; x < numberList.count; x++) {
            key = numberList[x]
            
            for (y = x; y > -1; y--) {
                if key < numberList[y] {
                    numberList.removeAtIndex(y + 1)
                    numberList.insert(key, atIndex: y)
                }
            }
        }
    }
    
    func bubbleSort() {
        var x, y, z, passes, key : Int
        
        for (x = 0; x < numberList.count; ++x) {
            
            passes = (numberList.count - 1) - x;
            
            for (y = 0; y < passes; y++) {
                key = numberList[y]
                
                if (key > numberList[y + 1]) {
                    z = numberList[y + 1]
                    numberList[y + 1] = key
                    numberList[y] = z
                }
            }
        }
    }
}

