//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Constants
    
    private enum Constants {
        static let itemsPerRow: CGFloat = 2
        static let horizontalInset: CGFloat = 16
        static let verticalInset: CGFloat = 8
        static let minimumLineSpacing: CGFloat = 16
        static let minimumInteritemSpacing: CGFloat = 7
        static let heightToWidthRatio: CGFloat = 1.4642
    }
    
    //MARK: - Properties
    
    var presenter: SearchViewOutput?
    
    //MARK: - Views
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.clipsToBounds = true
        searchBar.searchTextField.placeholder = "Поиск"
        searchBar.sizeToFit()
        return searchBar
    }()
    
    @IBOutlet weak private var helperView: UIView!
    @IBOutlet weak private var helperViewImageView: UIImageView!
    @IBOutlet weak private var helperViewTitleLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
}

//MARK: - Private method

private extension SearchViewController {
    func configureAppearance() {
        configureNavitionBar()
        configureCollectionView()
        configureHelperViewImageView()
        configureHelperViewTitleView()
    }
    
    func configureNavitionBar() {
        navigationItem.titleView = searchBar
        navigationController?.configureBackBarItem(image: Icon.backArrow)
    }
    
    func configureCollectionView() {
        collectionView.isHidden = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(MainItemCell.self)
        collectionView.contentInset = .init(top: Constants.verticalInset,
                                            left: Constants.horizontalInset,
                                            bottom: Constants.verticalInset,
                                            right: Constants.horizontalInset)
    }
    
    func configureHelperViewImageView() {
        helperViewImageView.image = Icon.search
        helperViewImageView.tintColor = .gray
    }
    
    func configureHelperViewTitleView() {
        helperViewTitleLabel.text = "Введите ваш запрос"
        helperViewTitleLabel.font = .systemFont(ofSize: 14)
        helperViewTitleLabel.textAlignment = .center
        helperViewTitleLabel.textColor = .gray
    }
    
}

//MARK: - SearchViewInput

extension SearchViewController: SearchViewInput {
    
}

//MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCell.self)", for: indexPath) as? MainItemCell else {
            fatalError("Cell not found")
        }
        cell.configure(item: presenter?.items[indexPath.row], completionHandler: nil)
        return cell
    }
}

//MARK: - UICollectionViewDelagateFlowLayout

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = Constants.itemsPerRow * Constants.horizontalInset + Constants.minimumInteritemSpacing
        let widthPerItem = (collectionView.bounds.width - paddingWidth) / Constants.itemsPerRow
        return .init(width: widthPerItem, height: widthPerItem * Constants.heightToWidthRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.minimumLineSpacing
    }
}
