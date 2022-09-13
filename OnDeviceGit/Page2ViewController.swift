//
//  Page2ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 13/09/22.
//

import UIKit

class Page2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var table1: UITableView!
    
    @IBOutlet weak var sample: UIImageView!
    
    struct data1{
        let img:String
        let name:String
        let phone:String
    }
    
    let mylist:[data1] = [data1(img: "hot", name: "Shafiq", phone: "9963439228"),
    data1(img: "download", name: "Shilpa", phone: "7989251662"),
    data1(img: "abc", name: "NagaMani", phone: "7788997766")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table1.delegate = self
        
        table1.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mylist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! MyTableViewCell1
        
        cell.title1.text = "\(mylist[indexPath.row].name)"
        cell.title2.text = "\(mylist[indexPath.row].phone)"
        
        cell.img1.image = UIImage(named: "\(mylist[indexPath.row].img)")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        sample.image = UIImage(named: "\(mylist[indexPath.row].img)")
    }
}
