//
//  DetailTitleCell.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 08/08/22.
//

import UIKit

class DetailTitleCell: UITableViewCell {

    @IBOutlet weak private var itemTitleLabel: UILabel!
    @IBOutlet weak private var itemDateLabel: UILabel!
    
    var itemTitle: String? {
        didSet {
            itemTitleLabel.text = itemTitle
        }
    }
    
    var itemData: String? {
        didSet {
            itemDateLabel.text = itemData
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
    
}

//MARK: - Private Methods

private extension DetailTitleCell {
    func configureAppearance() {
        itemTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        itemDateLabel.font = .systemFont(ofSize: 10)
        itemDateLabel.textColor = UIColor(red: 179 / 255, green: 179 / 255, blue: 179 / 255, alpha: 1)
        selectionStyle = .none
    }
}
