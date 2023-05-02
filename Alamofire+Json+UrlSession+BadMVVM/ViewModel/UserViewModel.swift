//
//  UserViewModel.swift
//  Alamofire+Json+UrlSession+BadMVVM
//
//  Created by MD Faizan on 02/05/23.
//

import UIKit
import Alamofire

class UserViewModel {
    
    weak var vc: ViewController?
    var arrUsers = [UserModel]()
    
    func getAllUserDataAF() {
        
        AF.request("https://jsonplaceholder.typicode.com/todos/").response { response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    
                    self.arrUsers.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tblView.reloadData()
                    }
                    print(self.arrUsers)
                }catch let err{
                    print(err.localizedDescription)
                    
                }
            }
        }
    }
    
    func getAllUserData() {
        
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { data, response, error in
            if error == nil {
                
                if let data = data {
                    do{
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tblView.reloadData()
                        }
                        print(self.arrUsers)
                    }catch let err{
                        print(err.localizedDescription)
                        
                    }
                }
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
    }
}


/**
 struct Login: Encodable {
 let email: String
 let password: String
 }
 
 let login = Login(email: "test@test.test", password: "testPassword")
 
 AF.request("https://httpbin.org/post",
 method: .post,
 parameters: login,
 encoder: JSONParameterEncoder.default).response { response in
 debugPrint(response)
 }
 
 */
