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
    var sessionQueue = DispatchQueue(label: "session", attributes: [])

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        status.text = "Generating random numbers"

        sessionStep { (message) -> Void in
            self.status.text = message
        }
        
    }
    
    func sessionStep(_ status: @escaping (_ message: String) -> Void) {
        sessionQueue.async(execute: {
            
            self.generateRandomNumbers(500)
            
            DispatchQueue.main.async(execute: {
                status("Insertion Sort")
            })
            
            self.insertionSort()

            DispatchQueue.main.async(execute: {
                status("Done. Generating new numbers")
            })
            
            self.generateRandomNumbers(500)

            DispatchQueue.main.async(execute: {
                status("Bubble Sort")
            })
            
            self.bubbleSort()
        
            DispatchQueue.main.async(execute: {
                status("Done")
            })
        })
    }
    
    func generateRandomNumbers(_ total: Int) {
        for _ in 0 ..< total {
            let rand = Int(arc4random() % 100000)
            numberList.append(rand)
        }
    }
    
    func insertionSort() {
        
        var b = numberList
        for i in 1..<b.count {
            var y = i
            while y > 0 && b[y] < b[y - 1] {
                swap(&b[y - 1], &b[y])
                y -= 1
            }
        }
        
        numberList = b
        
    }
    
    func bubbleSort() {
        
        var z, passes, key : Int
        
        for x in 0..<numberList.count {
            passes = (numberList.count - 1) - x;
            
            for y in 0..<passes {
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

