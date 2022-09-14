//
//  ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 12/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var listData1 = ["Shafiq", "Silpa", "NagaMani", "Moinuddin", "AndroBim"]

    @IBOutlet weak var MyImage: UIImageView!
    
    @IBOutlet weak var tableView1: UITableView!
    var b1 = true
    
    @IBOutlet weak var imgButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      //  MyImage.contentMode = .scaleToFill
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
        imgButton.setTitle("Change \(name)", for: .normal)
    }
    @IBAction func back2(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func Button1(_ sender: UIButton) {
        
    
        
        if(b1){
            
            MyImage.image = UIImage(named: "abc")
        } else {
            MyImage.image = UIImage(named: "download")
            
           
            
        }
        
        
        b1.toggle()
      
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listData1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        
     ///   cell.
        cell.textLabel?.text = "\(listData1[indexPath.row])"
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(listData1[indexPath.row])")
    }
    
}

