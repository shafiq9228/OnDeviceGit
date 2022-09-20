//
//  Web1ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 20/09/22.
//

import UIKit

class Web1ViewController: UIViewController {
    
    
    @IBOutlet weak var responseTxt: UILabel!
    
    
    var obj1:WebObject = WebObject(name: "", Course: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getObject(_ sender: UIButton) {
        
        GetObject()
        
    }
    
    func GetObject(){
        
        guard let url = URL(string: "https://androiddada.com/OnDevice/list2.php") else {
            
            print("Techniocal error")
            
            return
        }
        
       var urlrequest = URLRequest(url: url)


        
      //  urlrequest.setValue("WitrdHBRcmpSMjJ5L3BLa0NITXY1Zz09OjpL9i8Ocbb3tPpOq09kfTTd", forHTTPHeaderField: "apikey")
        
    
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
            
                    self.obj1 = jsonData
                    print(jsonData)
                    
                    self.responseTxt.text = "name: \(self.obj1.name) -- Course: \(jsonData.Course)"
                    
                    
                    
                    
                } catch let er2{
                    
                    print("Some catch error", er2)
                }
                
            }
            
            
            
            
            
        }
        
        mydata.resume()
        
        
    }
    
    
    
    
}
