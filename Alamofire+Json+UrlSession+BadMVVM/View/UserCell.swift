//
//  UserCell.swift
//  Alamofire+Json+UrlSession+BadMVVM
//
//  Created by MD Faizan on 02/05/23.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    var modelUser: UserModel?{
        didSet {
            userConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfiguration() {
        
        let status = modelUser?.getStatusColor()
        lblStatus.text = status?.0
        backgroundColor = status?.1
        if let id = modelUser?.id {
            lblID.text = "\(id)"
        }else{
            lblID.text = "No id"
        }
       
        lblTitle.text = modelUser?.title
    }
    
}
