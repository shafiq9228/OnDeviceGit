//
//  AddDataViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 14/09/22.
//

import UIKit

class AddDataViewController: UIViewController {
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    
    @IBOutlet weak var label1: UILabel!
    
    var mycolor = MyColors()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        label1.textColor = mycolor.color2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back2(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        mylist.append(data1(img: txt1.text!, name: txt2.text!, phone: txt3.text!))
      
        
        print("success")
        
        self.dismiss(animated: true)
    }
    
    
  
   

}
