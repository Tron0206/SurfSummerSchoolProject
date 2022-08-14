//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import UIKit

class SearchViewController: UIViewController, ModuleTransitionable {
    
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
        configureSearchTextField()
        configureHelperView(.writeRequest)
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing(recognizer:)))
        collectionView.addGestureRecognizer(tapGesture)
    }
    
    func configureHelperViewImageView() {
        helperViewImageView.tintColor = .gray
    }
    
    func configureHelperViewTitleView() {
        helperViewTitleLabel.font = .systemFont(ofSize: 14)
        helperViewTitleLabel.textAlignment = .center
        helperViewTitleLabel.textColor = .gray
        helperViewTitleLabel.numberOfLines = 2
    }
    
    func configureSearchTextField() {
        searchBar.delegate = self
    }
    
    func configureHelperView(_ status: HelperStatus) {
        helperViewTitleLabel.text = status.title
        helperViewImageView.image = status.icon
    }
    
    @objc func endEditing(recognizer: UITapGestureRecognizer) {
        let tapLocation = recognizer.location(in: view)
        let indexPath = collectionView.indexPathForItem(at: tapLocation)
        guard let indexPath = indexPath else {
            searchBar.endEditing(true)
            return
        }
        presenter?.showDetailViewController(for: indexPath)

    }
    
}

//MARK: - SearchViewInput

extension SearchViewController: SearchViewInput {
    func reload() {
        collectionView.reloadData()
    }
    
    func showHelper(_ status: HelperStatus) {
        configureHelperView(status)
        helperView.isHidden = false
        collectionView.isHidden = true
    }
    
    func showCollection() {
        helperView.isHidden = true
        collectionView.isHidden = false
    }
}

//MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.filteredItems.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainItemCell.self)", for: indexPath) as? MainItemCell else {
            fatalError("Cell not found")
        }
        cell.configure(item: presenter?.filteredItems[indexPath.item]) { [weak self] isFavorite in
            guard let self = self else {
                return
            }
            self.presenter?.filteredItems[indexPath.item].isFavorite = isFavorite
            self.presenter?.changeFavoriteStatus(for: indexPath, isFavorite: isFavorite)
        }
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

//MARK: - UICollectionViewDelegate

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showDetailViewController(for: indexPath)
    }
}

//MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        guard let presenter = presenter else {
            return true
        }
        if presenter.resultIsEmpty() {
            helperView.isHidden = false
            collectionView.isHidden = true
            return true
        }
        return true
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let presenter = presenter else {
             return
        }
        if searchText.isEmpty {
            presenter.showHelperView(.writeRequest)
        } else {
            presenter.searchPictures(searchText)
            if presenter.resultIsEmpty() {
                presenter.showHelperView(.noResult)
            } else {
                presenter.showCollectionView()
            }
            
        }
    }
    
    
}

