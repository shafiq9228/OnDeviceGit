//
//  AddDataViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 14/09/22.
//

import UIKit

class AddDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weblist:[WebList]? = nil
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var mycolor = MyColors()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        label1.textColor = mycolor.color2
        
        ReceiveData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back2(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func addbtn(_ sender: Any) {
        
        let localDict = ["uid":"\(txt1.text!)", "name":"\(txt2.text!)", "course":"\(txt3.text!)"]
        
        SendData(dict: localDict)
        
      
        
        print(weblist?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)
        
        cell.textLabel?.text = "\(weblist?[indexPath.row].name ?? "no value")"
        cell.detailTextLabel?.text = "\(weblist?[indexPath.row].course ?? "no value")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weblist?.count ?? 0
    }
    
    func SendData(dict:[String:String]){
        guard let url = URL(string:"https://androiddada.com/OnDevice/up.php") else {
            print("Techniocal error")
            
            return }
        
        var urlrequest = URLRequest(url: url)
         urlrequest.setValue("WitrdHBRcmpSMjJ5L3BLa0NITXY1Zz09OjpL9i8Ocbb3tPpOq09kfTTd", forHTTPHeaderField: "Apikey")
         urlrequest.httpMethod = "POST"
        
        let dicBody:[String:String] = dict
        
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
                
                let jsonData = try JSONDecoder().decode( [String:String].self, from: data)
                
                
               print(jsonData)
                
                DispatchQueue.main.async {
                    self.ReceiveData()
                }
                
              
                
            } catch let er2{
                
                print("Some catch error", er2)
            }
                
            
            
            
            
        }
        
        mydata.resume()
        
    }
    
    
    func ReceiveData(){
        guard let url = URL(string:"https://androiddada.com/OnDevice/get.php") else {
            print("Techniocal error")
            
            return }
        
        var urlrequest = URLRequest(url: url)
         urlrequest.setValue("WitrdHBRcmpSMjJ5L3BLa0NITXY1Zz09OjpL9i8Ocbb3tPpOq09kfTTd", forHTTPHeaderField: "Apikey")
         urlrequest.httpMethod = "POST"
        
    
        
        
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
                
             
                let jsonData = try JSONDecoder().decode( [WebList].self, from: data)
                
                DispatchQueue.main.async {
                self.weblist = jsonData
                    
                    self.tableView.reloadData()
                
                print(jsonData)
                    
                }
                
              
                
            } catch let er2{
                
                print("Some catch error", er2)
            }
                
            
            
            
            
        }
        
        mydata.resume()
        
    }
    
   
    
    
  
   

}
