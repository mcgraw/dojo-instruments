//
//  XMCAllocations.swift
//  instruments
//
//  Created by David McGraw on 1/26/15.
//  Copyright (c) 2015 David McGraw. All rights reserved.
//

import UIKit
import PINRemoteImage

class XMCAllocations: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet weak var reloadAction: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        reload()
    }
    
    @IBAction func reload() {
        reloadAction.isEnabled = false
        
        image1.image = nil
        image2.image = nil
        image3.image = nil
        image4.image = nil
        image5.image = nil
        image6.image = nil
        image7.image = nil
        image8.image = nil
        image9.image = nil
        
        // Slooooowwwww
//        for var x: Int = 0; x < 9; x++ {
//            loadSlowImage(index: x)
//        }
        
        // Cache that stuff
        for x: Int in 0 ..< 9 {
            loadFastImage(index: x)
        }
        
        reloadAction.isEnabled = true
    }
    
    func loadSlowImage(index: Int) {
        let url = URL(string: "http://www.xmcgraw.com/pets/png/siberian\(index).png")
        if let path = url {
            let data = try? Data(contentsOf: path)
            if let d = data {
                switch index {
                case 0:
                    image1.image = UIImage(data: d)! // not nil please
                case 1:
                    image2.image = UIImage(data: d)!
                case 2:
                    image3.image = UIImage(data: d)!
                case 3:
                    image4.image = UIImage(data: d)!
                case 4:
                    image5.image = UIImage(data: d)!
                case 5:
                    image6.image = UIImage(data: d)!
                case 6:
                    image7.image = UIImage(data: d)!
                case 7:
                    image8.image = UIImage(data: d)!
                case 8:
                    image9.image = UIImage(data: d)!
                default:
                    break
                }
            }
        }
    }
    
    func loadFastImage(index: Int) {
        let url = URL(string: "http://www.xmcgraw.com/pets/png/siberian\(index).png")!
        
        switch index {
        case 0:
            image1.pin_setImage(from: url)
        case 1:
            image2.pin_setImage(from: url)
        case 2:
            image3.pin_setImage(from: url)
        case 3:
            image4.pin_setImage(from: url)
        case 4:
            image5.pin_setImage(from: url)
        case 5:
            image6.pin_setImage(from: url)
        case 6:
            image7.pin_setImage(from: url)
        case 7:
            image8.pin_setImage(from: url)
        case 8:
            image9.pin_setImage(from: url)
        default:
            break
        }
    }
}
