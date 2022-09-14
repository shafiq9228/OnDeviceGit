//
//  DetailViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 14/09/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image1.image = UIImage(named: "\(mylist[ind].img)")
        
        label1.text = "\(mylist[ind].name)"
        
        label2.text = "\(mylist[ind].phone)"
    }
    
    @IBAction func dismissback(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    

}
