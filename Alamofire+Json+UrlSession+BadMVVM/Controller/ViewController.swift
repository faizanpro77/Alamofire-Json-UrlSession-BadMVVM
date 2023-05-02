//
//  ViewController.swift
//  Alamofire+Json+UrlSession+BadMVVM
//
//  Created by MD Faizan on 02/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
   
    var viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        viewModelUser.vc = self
        viewModelUser.getAllUserDataAF()
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
      
        cell?.modelUser = viewModelUser.arrUsers[indexPath.row]
       
        return cell!
        
        
    }
    
}


