//
//  LoadViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 21/09/22.
//

import UIKit

class LoadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func diss(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
        
        cell.textLabel?.text = "\(myTablelist[indexPath.row].name ?? "no valu") -  \(myTablelist[indexPath.row].id ?? "no valu")"
        
        cell.detailTextLabel?.text = "\(myTablelist[indexPath.row].Course ?? "no valu")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTablelist.count
    }

}
