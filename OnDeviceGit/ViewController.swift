//
//  ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 12/09/22.
//

import UIKit

class ViewController: UIViewController {
   
   
    @IBOutlet weak var txt1: UITextField!
    
    @IBOutlet weak var out1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      //  MyImage.contentMode = .scaleToFill
    
    }
    @IBAction func back2(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    
    @IBAction func submitbt(_ sender: Any) {
        
        
        SendBody(id: "\(txt1.text ?? "0")")
        
       // print(txt1.text)
    }
    
    
    func SendBody(id:String){
        guard let url = URL(string:"https://androiddada.com/OnDevice/api.php/body") else {
            print("Techniocal error")
            
            return }
        
        var urlrequest = URLRequest(url: url)
         urlrequest.setValue("WitrdHBRcmpSMjJ5L3BLa0NITXY1Zz09OjpL9i8Ocbb3tPpOq09kfTTd", forHTTPHeaderField: "Apikey")
         urlrequest.httpMethod = "POST"
        
        let dicBody:[String:String] = ["id":id]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: dicBody)
        
        urlrequest.httpBody = bodyData
        
        
        let mydata = URLSession.shared.dataTask(with: urlrequest) { data, resp, err in
            if let er1 = err{
                
                print("there is some error: ", er1)
                return
            }
            
            guard let data = data else {
                print("Data error: ")
                
                return
            }
           
            do{
                
                let jsonData = try JSONDecoder().decode( WebObject.self, from: data)
                
                
                
                print(jsonData)
                
                
                
                DispatchQueue.main.async {
                
                    self.out1.text = "\(jsonData)"
                    
                }
                
              
                
            } catch let er2{
                
                print("Some catch error", er2)
            }
                
            
            
            
            
        }
        
        mydata.resume()
        
    }
    
   
    
}

