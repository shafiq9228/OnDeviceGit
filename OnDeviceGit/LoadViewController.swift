//
//  LoadViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 21/09/22.
//

import UIKit

class LoadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    var locallist:[WebObject] = [WebObject(id: "1", name: "ShafiqLocal", Course: "Android")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        
        GetArray()
    }
    
    @IBAction func diss(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
        
        cell.textLabel?.text = "\(locallist[indexPath.row].name ?? "no valu") -  \(locallist[indexPath.row].id ?? "no valu")"
        
        cell.detailTextLabel?.text = "\(locallist[indexPath.row].Course ?? "no valu")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locallist.count
    }
    
    func GetArray(){
        
        guard let url = URL(string: "https://androiddada.com/OnDevice/api.php/arraylist") else {
            
            print("Techniocal error")
            
            return
        }
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
                
                let jsonData = try JSONDecoder().decode( [WebObject].self, from: data)
                
                
                DispatchQueue.main.async {
                
                self.locallist = jsonData
                
                self.tableView.reloadData()
                    
                }
                
              //  self.mylist = jsonData
                
               // self.tableView.dataSource = self
                
                
                print(jsonData)
                
            } catch let er2{
                
                print("Some catch error", er2)
            }
                
            
            
            
            
        }
        
        mydata.resume()
        
    }

}
