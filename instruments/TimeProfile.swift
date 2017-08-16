//
//  TimeProfile.swift
//  instruments
//
//  Created by David McGraw on 1/26/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class TimeProfile: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var status: UILabel!
    
    // MARK: - Public Properties
    
    /// A list containing the data used for sorting
    var numberList = [Int]()
    
    /// A dedicated queue for the session
    var sessionQueue = DispatchQueue(label: "session", attributes: [])

    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        status.text = "Generating random numbers"

        sessionStep { (message) -> Void in
            self.status.text = message
        }
        
    }
    
    // MARK: - Private Methods
    
    /**
     Steps through a series of methods that sorts a series of random numbers. Observe
     the effects in Instruments
    */
    fileprivate func sessionStep(_ status: @escaping (_ message: String) -> Void) {
        
        sessionQueue.async {
            
            self.generateRandomNumbers(500)
            
            DispatchQueue.main.async {
                status("Insertion Sort")
            }
            
            self.insertionSort()

            DispatchQueue.main.async {
                status("Done. Generating new numbers")
            }
            
            self.generateRandomNumbers(500)

            DispatchQueue.main.async {
                status("Bubble Sort")
            }
            
            self.bubbleSort()
        
            DispatchQueue.main.async {
                status("Done")
            }
            
        }
        
    }
    
    /**
     Generates a random list of numbers that are stored in `numberList`
    */
    fileprivate func generateRandomNumbers(_ total: Int) {
        
        for _ in 0 ..< total {
            
            let rand = Int(arc4random() % 100000)
            numberList.append(rand)
            
        }
        
    }
    
    /**
     Perfroms an insertion sort on the numbers contained in `numberList`
    */
    fileprivate func insertionSort() {
        
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
    
    /**
     Perfroms a bubble sort on the numbers contained in `numberList`
    */
    fileprivate func bubbleSort() {
        
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

