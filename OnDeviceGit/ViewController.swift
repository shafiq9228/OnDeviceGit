//
//  ViewController.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 12/09/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      //  MyImage.contentMode = .scaleToFill
    
    }
    @IBAction func back2(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func gallery(_ sender: Any) {
        
        let pc = UIImagePickerController()
        pc.sourceType = .photoLibrary
        pc.delegate = self
        pc.allowsEditing = true
        self.present(pc, animated: true)
    }
    
    @IBAction func openCamera(_ sender: Any) {
        
        let pc = UIImagePickerController()
        pc.sourceType = .camera
        pc.delegate = self
        pc.allowsEditing = false
        self.present(pc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.editedImage] as? UIImage {
            img.image = selectedImage
            
        } else {
            print("No image found")
        }
        
        picker.dismiss(animated: true)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(" cancelled selction")
        
        picker.dismiss(animated: true)
    }
    
   
    
}

