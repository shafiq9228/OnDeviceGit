//
//  MainViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 13/09/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var labeltest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        labeltest.text = "\(name)"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func testAct(_ sender: Any) {
        
        
        name = "A2"
        
        labeltest.text = "\(name)"
    }
    

}
