//
//  FavoriteCell.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    //TODO: - Rafactor code
    private enum Constants {
        static let heartImage = UIImage(named: "favorite")
        static let filledHeartImage = UIImage(named: "favorite-fill")
    }
    
    //MARK: - Views
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    //MARK: - Events
    
    var completionHandler: ((Bool) -> Void)?
    
    //MARK: - Properties
    
    var image: String = "" {
        didSet {
            imageView.loadImage(from: image)
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var date: String? {
        didSet {
            dateLabel.text = date
        }
    }
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    var isFavorite: Bool = true {
        didSet {
            let image = isFavorite ? Constants.filledHeartImage : Constants.heartImage
            favoriteButton.setImage(image, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
    //MARK: - Internal methods
    
    func configure(item: ItemModel?, completionHandler: @escaping (Bool) -> Void) {
        guard let item = item else {
            return
        }
        image = item.imageUrlString
        title = item.title
        date = item.dataCreation
        descriptionText = item.description
        isFavorite = true
        self.completionHandler = completionHandler

    }

    //MARK: - Actions
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        completionHandler?(isFavorite)
    }
}

//MARK: - Private methods

private extension FavoriteCell {
    func configureAppearance() {
        configureImageView()
        configureTitleLabel()
        configureDateLabel()
        configureImageView()
        configureDescriptionLabel()
    }
    
    func configureImageView() {
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
    }
    
    func configureTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    func configureDateLabel() {
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = UIColor(red: 179 / 255, green: 179 / 255, blue: 179 / 255, alpha: 1)
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 1
    }
}
