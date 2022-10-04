//
//  ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 12/09/22.
//

import UIKit
import FirebaseAuth
//import Kingfisher

class ViewController: UIViewController {
   

    
    @IBOutlet weak var mobileInp: UITextField!
    
    @IBOutlet weak var passInp: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(Auth.auth().currentUser != nil){
            DispatchQueue.main.async {
                let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! Page2ViewController
                vc1.modalPresentationStyle = .fullScreen
                self.present(vc1, animated: true)
            }
            
        } else {
            
            print("user is not logged in ")
        }
        
        
    
    }
    
 
    
    
    @IBAction func submitCredntials(_ sender: Any) {
        
        
        print("hello")
        let mobileTxt = mobileInp.text
        let passtxt = passInp.text
        
        SignUp(email: mobileTxt!, pass: passtxt!)
        
    }
    
    func SignIn(email:String, pass:String){
        Auth.auth().signIn(withEmail: email, password: pass){ authResult, error in
           // guard let strongSelf = self else { return }
            
            
            if let err = error{
                print(err)
            } else {
                print(authResult?.user.uid)
                
                let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! Page2ViewController
                vc1.modalPresentationStyle = .fullScreen
                self.present(vc1, animated: true)
            }
            
          }
    }
    
    func SignUp(email:String, pass:String){
        
        
        Auth.auth().createUser(withEmail: email, password: pass){ authResult, error in
            if let err = error{
                print(err)
            } else {
                print(authResult?.user.uid)
                
                let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page2") as! Page2ViewController
                vc1.modalPresentationStyle = .fullScreen
                self.present(vc1, animated: true)
            }
            
        }
    }
    
    
   
    
}

