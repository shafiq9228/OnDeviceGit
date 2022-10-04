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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let retrivedValue = UserDefaults.standard.integer(forKey: "counter")
        
        num = retrivedValue
        numtxt.text = "\(retrivedValue)"
   
    }
    
    @IBAction func countNumber(_ sender: Any) {
        
        num = num + 1
        
        UserDefaults.standard.set(num, forKey: "counter")
        
        numtxt.text = "\(num)"
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
}
