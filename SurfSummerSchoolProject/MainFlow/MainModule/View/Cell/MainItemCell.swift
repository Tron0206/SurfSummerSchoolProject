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
    
    //MARK: - Events

    var completionHandler: ((Bool) -> Void)?
    
    //MARK: - Views
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    //MARK: - Properties
    
    var isFavorite: Bool = false {
        didSet {
            let image = isFavorite ? Constants.filledHeartImage : Constants.heartImage
            favoriteButton.setImage(image, for: .normal)
        }
    }
        
    //MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        imageView.image = nil
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.transform = self.isHighlighted ? .init(scaleX: 0.98, y: 0.98) : .identity
            }
        }
    }

    //MARK: - Actions
    
    @IBAction private func tappedFavoriteButton(_ sender: Any) {
        isFavorite.toggle()
        completionHandler?(isFavorite)
    }
    
    //MARK: - Internal methods
    
    func configure(item: ItemModel?, completionHandler: ((Bool) -> Void)?) {
        guard let item = item else {
            return
        }
        titleLabel.text = item.title
        imageView.loadImage(from: item.imageUrlString)
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
    }
}

