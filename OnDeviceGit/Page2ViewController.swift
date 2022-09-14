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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table1.delegate = self
        
        table1.dataSource = self

        // Do any additional setup after loading the view.
    }
    @IBAction func back1(_ sender: Any) {
        
        self.dismiss(animated: true)
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
        
        ind = indexPath.row
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        
        vc.modalTransitionStyle = .crossDissolve
        
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
        
        
      //  sample.image = UIImage(named: "\(mylist[indexPath.row].img)")
    }
}
