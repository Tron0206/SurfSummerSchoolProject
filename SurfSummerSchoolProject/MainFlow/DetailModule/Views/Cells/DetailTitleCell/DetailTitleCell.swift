//
//  DetailTitleCell.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 08/08/22.
//

import UIKit

final class DetailTitleCell: UITableViewCell {

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
        configureTitleLabel()
        configureDateLabel()
        selectionStyle = .none
    }
    
    func configureTitleLabel() {
        itemTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func configureDateLabel() {
        itemDateLabel.font = .systemFont(ofSize: 10, weight: .medium)
        itemDateLabel.textColor = UIColor(red: 179 / 255, green: 179 / 255, blue: 179 / 255, alpha: 1)
    }
}
