//
//  FavoriteViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 09/08/22.
//

import UIKit

class FavoriteViewController: UIViewController {
    //TODO: - Rafactor code
    var presenter: FavoriteViewOutput?
    
    private enum Constants {
        static let horizontalInset: CGFloat = 16
        static let verticalInset: CGFloat = 8
        static let hightToWidthRatio: CGFloat = 1.1603
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "SearchIcon"),
                                     style: .done,
                                     target: self,
                                     action: #selector(tappedSearchButton))
        button.tintColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

    @objc private func tappedSearchButton() {
        print("Search in FavoriteVC")
    }
}

//MARK: - Private methods

private extension FavoriteViewController {
    func configureAppearance() {
        navigationItem.setRightBarButton(searchButton, animated: true)
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.contentInset = .init(top: Constants.verticalInset,
                                            left: Constants.horizontalInset,
                                            bottom: Constants.verticalInset,
                                            right: Constants.horizontalInset)
        collectionView.dataSource = self
        collectionView.registerCell(FavoriteCell.self)
    }
}

//MARK: - UICollectionViewDataSource

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FavoriteCell.self)", for: indexPath) as? FavoriteCell else {
            fatalError()
        }
        cell.backgroundColor = .red
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = view.bounds.width - (2 * Constants.horizontalInset)
        return .init(width: availableWidth, height: availableWidth * Constants.hightToWidthRatio)
    }
}

//MARK: - FavoriteViewInput

extension FavoriteViewController: FavoriteViewInput {
    
}

