//
//  MainItemCell.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 05/08/22.
//

import UIKit

class MainItemCell: UICollectionViewCell {
    
    //MARK: - Constants
    
    private enum Constants {
        static let heartImage = UIImage(named: "favorite")
        static let filledHeartImage = UIImage(named: "favorite-fill")
    }

    //MARK: - Views
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    //MARK: - Properties
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var isFavorite: Bool = false {
        didSet {
            let image = isFavorite ? Constants.filledHeartImage : Constants.heartImage
            favoriteButton.setImage(image, for: .normal)
        }
    }
    
    var completionHandler: ((Bool) -> Void)?
    
    //MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
        // Initialization code
    }

    //MARK: - Actions
    
    @IBAction private func tappedFavoriteButton(_ sender: Any) {
        isFavorite.toggle()
        completionHandler?(isFavorite)
    }
    
    //MARK: - Internal methods
    
    func configure(item: ItemModel?, completionHandler: @escaping (Bool) -> Void) {
        guard let item = item else {
            return
        }
        title = item.title
        image = item.image
        isFavorite = item.isFavorite
        self.completionHandler = completionHandler
    }
}

//MARK: - Private methods
private extension MainItemCell {
    func configureAppearance() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 12)
        imageView.layer.cornerRadius = 12
        favoriteButton.tintColor = .white
        imageView.backgroundColor = .red
    }
}

