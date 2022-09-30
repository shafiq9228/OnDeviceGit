//
//  ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 12/09/22.
//

import UIKit
//import Kingfisher

class ViewController: UIViewController {
   

    @IBOutlet weak var img: UIImageView!
    
    let myurl = "https://lumiere-a.akamaihd.net/v1/images/sa_pixar_virtualbg_coco_16x9_9ccd7110.jpeg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: myurl)
       
       // img.kf.setImage(with: url)
    
    }
    @IBAction func back2(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func gallery(_ sender: Any) {
        
        
    }
    
    @IBAction func openCamera(_ sender: Any) {
        
       
    }
    
    
    
   
    
}

