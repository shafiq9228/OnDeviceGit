//
//  Test1.swift
//  OnDeviceGit
//
//  Created by MD SHAFIQ PATEL on 20/09/22.
//

import Foundation


/*
func getOtp(phonenum: String) {

   print(phonenum)


    guard let url = URL(string:"https://androidtraininginstitute.com/dakshinpay/api/sendotp/") else { fatalError("Missing URL") }
    
    
    var urlRequest = URLRequest(url: url)
    
    urlRequest.setValue("1492507516844", forHTTPHeaderField: "apikey")
    
    
    let body = ["mobile_no": phonenum,"source": "android"]
    let bodyData = try? JSONSerialization.data(
        withJSONObject: body
    )

    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = bodyData

    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        
        if let error = error {
            print("Request error: ", error)
            return
        }
        guard let data = data else { return }
  
            DispatchQueue.main.async {
                do {
                   
                    let decodedUsers = try JSONDecoder().decode(Userotp.self, from: data)
                    self.users  = decodedUsers
                    print(decodedUsers)
                    
                    if(self.users.status == 1){

                        self.changeScreen = 1
                        self.phonenum = phonenum
                    }
                    else{
                        self.alertbox = true
                        self.alertmsg = self.users.message
                    }
                
                } catch let error {
                    print("Error decoding: ", error)
                    do{
                        let failedresult = try JSONDecoder().decode(failedModel.self, from: data)
                        print(failedresult.message)
                        self.failedmodel = failedresult
                        self.alertbox = true
                        self.alertmsg = self.failedmodel.message
                            
                    }
                    catch let othererror {
                        print("Error decode", othererror)
                    }
                }
            
        }
    }
    dataTask.resume()
}
*/
