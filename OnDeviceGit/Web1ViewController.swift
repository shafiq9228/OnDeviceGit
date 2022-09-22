//
//  Web1ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 20/09/22.
//

import UIKit

class Web1ViewController: UIViewController {
    
    
    
    
    
    
    @IBOutlet weak var responseTxt: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    var obj1:WebObject = WebObject(name: "", Course: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getObject(_ sender: UIButton) {
        
        GetObject()
        
    }
    
    
    @IBAction func getArray(_ sender: UIButton) {
      
        
    }
    
  
    
  
    
    
    func GetObject(){
        
        guard let url = URL(string: "https://androiddada.com/OnDevice/api.php/objlist") else {
            
            print("Techniocal error")
            
            return
        }
        
       var urlrequest = URLRequest(url: url)
        urlrequest.setValue("WitrdHBRcmpSMjJ5L3BLa0NITXY1Zz09OjpL9i8Ocbb3tPpOq09kfTTd", forHTTPHeaderField: "Apikey")
        urlrequest.httpMethod = "POST"
       
        
        let mydata = URLSession.shared.dataTask(with: urlrequest) { (data, res, err) in
            
            if let er1 = err{
                
                print("there is some error: ", er1)
                return
            }
            
            guard let data = data else {
                print("Data error: ")
                
                return
            }
            
            DispatchQueue.main.async {
                do {
                    
                    let jsonData = try JSONDecoder().decode(WebObject.self, from: data)
                    
                    print(jsonData)
                    
                    //  print(jsonData.name)
                    
                     // self.responseTxt.text = "name: \(jsonData.name ?? "no data"), id: \(jsonData.id ?? "no id")"
                    
                    
                     self.responseTxt.text = "name: \(jsonData.name ?? "we3sfgr") -- Course: \(jsonData.Course ?? "we3sfgr") -- id: \(jsonData.id ?? "no id")"
                    
                    
                    
                    
                } catch let er2{
                    
                    print("Some catch error", er2)
                }
                
            }
                
  
            
        }
        
        mydata.resume()
        
        
    }
    
    
    
    
}
