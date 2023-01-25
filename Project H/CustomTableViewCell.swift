//
//  CustomTableViewCell.swift
//  MLC Waikiki
//
//  Created by Uğurcan Sevinç on 24.12.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var superContainerView: UIView!
    
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        superContainerView.layer.cornerRadius = 10
        view.layer.cornerRadius = 10
        superContainerView.layer.shadowColor = UIColor.black.cgColor
        superContainerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        superContainerView.layer.shadowOpacity = 0.2
        superContainerView.layer.shadowRadius = 0.8

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
