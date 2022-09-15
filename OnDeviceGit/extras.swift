//
//  extras.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 15/09/22.
//

import Foundation
import UIKit


protocol abc{
    
    var id:Int {get}
    var colleg:String {get}
    var rank:Int {get}
    func rank100()->Int
    
    
}

protocol mytheme{
    var color1:UIColor {get}
    var color2:UIColor {get}
}


struct MyColors:mytheme{
    var color1: UIColor = .blue
    var color2: UIColor = .red
    
}



struct Basket:abc{
    var id: Int
    var colleg: String
    var rank: Int
    func rank100() -> Int {
        return rank*100
    }
    var name:String
 
}

struct Fruits: Identifiable{
    var id: ObjectIdentifier
    
    
    var name:String
    
}

var A1 = Basket(id: 1, colleg: "JNTUq", rank: 10, name: "Shafiq")


