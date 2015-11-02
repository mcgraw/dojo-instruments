//
//  XMCTimeProfileImages.swift
//  instruments
//
//  Created by David McGraw on 1/26/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit

class XMCTimeProfileImages: UIViewController {
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    @IBOutlet weak var image3: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        reload()
    }
    
    @IBAction func reload() {
        image1.image = nil
        image2.image = nil
        image3.image = nil
        
        loadSlowImage1()
        
        loadImage2()
        
        loadFastImage3()
    }
    
    func loadSlowImage1() {
        let url = NSURL(string: "http://www.xmcgraw.com/pets/png/siberian12.png")
        if let path = url {
            let data = NSData(contentsOfURL: path)
            if let d = data {
                image1?.image = UIImage(data: d)
            }
        }
    }
    
    func loadImage2() {
        let path = NSBundle.mainBundle().pathForResource("siberian16", ofType: "png")!
        let img = UIImage(contentsOfFile: path)
        if let i = img {
            image2.image = i
        }
    }
    
    func loadFastImage3() {
        image3?.image = UIImage(named: "siberian18")
    }

}
