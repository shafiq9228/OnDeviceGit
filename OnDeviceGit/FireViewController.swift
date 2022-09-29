//
//  FireViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 29/09/22.
//

import UIKit
import FirebaseFirestore

class FireViewController: UIViewController {

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    
    @IBOutlet weak var respLbl: UILabel!
    
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back1(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
   
    @IBAction func sendData(_ sender: Any) {
        
        
        let docData = [
            "name":"\(txt2.text ?? "none")",
            "empID":"\(txt1.text ?? "none")",
            "salary":"\(txt3.text ?? "none")"
        ]
        
        
        ref = db.collection("myusers").addDocument(data: docData) { err in
            if let err = err {
                print("Error adding document: \(err)")
                
                self.respLbl.text = "error is: \(err)"
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
                
                self.respLbl.text = "ID is: \(self.ref!.documentID)"
            }
        }

        
        
    }
    
}
