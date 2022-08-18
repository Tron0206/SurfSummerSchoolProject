//
//  HeaderTableViewCell.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 17/08/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    //MARK: - Views
    
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
}

//MARK: - Private methods

private extension HeaderTableViewCell {
    func configureAppearance() {
        separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        selectionStyle = .none
        configureProfileImageView()
        configureNameLabel()
        configureStatusLabel()
    }
    
    func configureProfileImageView() {
        profileImageView.layer.cornerRadius = 12
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .blue
    }
    
    func configureNameLabel() {
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        nameLabel.text = "Александра\nНовикова"
    }
    
    func configureStatusLabel() {
        statusLabel.font = .systemFont(ofSize: 12)
        statusLabel.textColor = .gray
        statusLabel.text = "«Светлое будущее живет в вечности»"
    }
}
