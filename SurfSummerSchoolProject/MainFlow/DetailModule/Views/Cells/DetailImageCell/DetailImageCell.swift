//
//  DetailTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 08/08/22.
//

import UIKit

class DetailImageCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            itemImageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
}

//MARK: - Private Methods

private extension DetailImageCell {
    func configureAppearance() {
        itemImageView.layer.cornerRadius = 12
        itemImageView.contentMode = .scaleToFill
        selectionStyle = .none
    }
}
