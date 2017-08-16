//
//  Leaks.swift
//  dojo-instruments
//
//  Created by David McGraw on 1/26/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class Object1 {
    
    var object: Object2?
    deinit { print("Object1 is being deinitialized") }
    
}

class Object2 {
    
//    weak var object: Object1? // assign weak to avoid a strong reference cycle
    var object: Object1?
    deinit { print("Object2 is being deinitialized") }
    
}

class Leaks: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        var obj1: Object1?
        var obj2: Object2?
        
        obj1 = Object1()
        obj2 = Object2()
        
        obj1?.object = obj2
        obj2?.object = obj1
        
        obj1 = nil
        
    }
    
}
