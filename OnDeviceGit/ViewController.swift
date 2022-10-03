//
//  ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 12/09/22.
//

import UIKit
//import Kingfisher

class ViewController: UIViewController {
   

    
    @IBOutlet weak var mobileInp: UITextField!
    
    @IBOutlet weak var passInp: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginValue = UserDefaults.standard.integer(forKey: "login")
        
        print("LoginValue = \(loginValue)")
        
        if(loginValue == 1){
        
        DispatchQueue.main.async {
            let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! Page2ViewController
            vc1.modalPresentationStyle = .fullScreen
            self.present(vc1, animated: true)
        }
           
        }
    
    }
    
 
    
    
    @IBAction func submitCredntials(_ sender: Any) {
        
        
        let mobileTxt = mobileInp.text
        let passtxt = passInp.text
        
        if(mobileTxt == "9963439228" && passtxt == "12345"){
            
            print("yes correcr credentials")
            
            UserDefaults.standard.set(1, forKey: "login")
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "page2") as! Page2ViewController
            
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true)
        } else {
            print("wrong login credentials")
            
            
        }
        
    }
    
    
   
    
}

