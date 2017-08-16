//
//  TimeProfileImages.swift
//  instruments
//
//  Created by David McGraw on 1/26/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class TimeProfileImages: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    // MARK: - IBActions
    
    @IBAction func reload() {
        
        image1.image = nil
        image2.image = nil
        image3.image = nil
        
        loadSlowImage1()
        
        loadImage2()
        
        loadFastImage3()
        
    }
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        reload()
        
    }
    
    // MARK: - Private Methods
    
    /**
     Loads an image at a provided remote location
    */
    fileprivate func loadSlowImage1() {
        
        let url = URL(string: "http://www.xmcgraw.com/pets/png/siberian12.png")
        if let path = url {
            
            let data = try? Data(contentsOf: path)
            if let d = data {
                image1?.image = UIImage(data: d)
            }
            
        }
        
    }
    
    /**
     Loads an image local to the device
    */
    fileprivate func loadImage2() {
        
        let path = Bundle.main.path(forResource: "siberian16", ofType: "png")!
        let img = UIImage(contentsOfFile: path)
        if let i = img {
            image2.image = i
        }
        
    }
    
    /**
     Loads an image within the app bundle
    */
    fileprivate func loadFastImage3() {
        image3?.image = UIImage(named: "siberian18")
    }

}
