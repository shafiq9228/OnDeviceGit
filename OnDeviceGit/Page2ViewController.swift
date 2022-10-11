//
//  Page2ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 13/09/22.
//

import UIKit
import FirebaseAuth


class Page2ViewController: UIViewController {
    
    
    @IBOutlet weak var numtxt: UILabel!
    
    var num = 0
    
    var res = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let retrivedValue = UserDefaults.standard.integer(forKey: "counter")
        
       // num = retrivedValue
       // numtxt.text = "\(retrivedValue)"
   
    }
    
   
    @IBAction func logoutPage(_ sender: Any) {
        
        
        let firebaseAuth = Auth.auth()
      do {
        try firebaseAuth.signOut()
      } catch let signOutError as NSError {
        print("Error signing out: %@", signOutError)
      }
        
        self.dismiss(animated: true)
    
        UserDefaults.standard.set(0, forKey: "counter")
    }
    
    
    @IBAction func numberAction(_ sender: Any) {
        
        let x1 = sender as? UIButton
        
        let num1 = x1?.titleLabel?.text
        
        print(num1!)
        
        if(num1! == "C"){
            numtxt.text = "0"
            res = ""
            
        } else {
            
            res = res + "\(num1!)"
            
            numtxt.text = "\(res)"
        }
        
      
     
      
        
    }
    
  
    
}
