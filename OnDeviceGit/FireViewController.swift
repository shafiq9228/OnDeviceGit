//
//  FireViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 29/09/22.
//

import UIKit
import FirebaseFirestore

class FireViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    
    @IBOutlet weak var respLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    var fireList:[FireModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back1(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    func getDocData(){
        let docRef = db.collection("Users").document("moinDoc")
        
        docRef.getDocument { doc, err in
            if let doc = doc , doc.exists{
                
                let mydict:[String: Any] = doc.data() ?? ["name": "none"]
                self.respLbl.text = "doc: \(mydict["rank"] ?? "1gg")"
            } else {
                self.respLbl.text = "no doc found"
            }
        }
    }
    
    func GetDocList(){
        db.collection("Users").getDocuments { (snapshot, err) in
            
            if let err = err {
                print("Some error while fetching docs: \(err)")
                
                self.respLbl.text = "Some error while fetching docs: \(err)"
            } else {
                
               // self.fireList.remove(at: 0)
                for x in snapshot!.documents{
                    
                    print("\(x.documentID)")
                    let mydict:[String: Any] = x.data()
                    
                    let tempModel = FireModel(name: "\(mydict["name"] ?? "name")", city: "\(mydict["city"] ?? "city")")
                    
                    self.fireList.append(tempModel)
                    
                   // self.tableView.reloadData()
                    
                    print(self.fireList.count)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    print(self.fireList.count)
                }
               
            }
        }
        
    }
   
    @IBAction func sendData(_ sender: Any) {
        
        
       // getDocData()
        
        GetDocList()
        
        
//        let docData = [
//            "name":"\(txt2.text ?? "none")",
//            "empID":"\(txt1.text ?? "none")",
//            "salary":"\(txt3.text ?? "none")"
//        ]
//
//
//        ref = db.collection("myusers").addDocument(data: docData) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//
//                self.respLbl.text = "error is: \(err)"
//            } else {
//                print("Document added with ID: \(self.ref!.documentID)")
//
//                self.respLbl.text = "ID is: \(self.ref!.documentID)"
//            }
//        }

        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellfire", for: indexPath)
        
        cell.textLabel?.text = "\(fireList[indexPath.row].name)"
        cell.detailTextLabel?.text = "\(fireList[indexPath.row].city)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fireList.count
    }
    
    
}
