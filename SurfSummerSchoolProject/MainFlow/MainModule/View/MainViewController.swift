//
//  MainViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 03/08/22.
//

import UIKit

class MainViewController: UIViewController, ModuleTransitionable {
    
    //MARK: - Constants
    
    private enum Constants {
        static let itemsPerRow: CGFloat = 2
        static let horizontalInset: CGFloat = 16
        static let verticalInset: CGFloat = 8
        static let minimumLineSpacing: CGFloat = 16
        static let minimumInteritemSpacing: CGFloat = 7
        static let heightToWidthRatio: CGFloat = 1.4642
    }
    
    //MARK: - Views
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    
    private lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "SearchIcon"),
                                     style: .done,
                                     target: self,
                                     action: #selector(tappedSearchButton))
        button.tintColor = .black
        return button
    }()
    
    //MARK: - Properties
    
    var presenter: MainViewOutput?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
//        configureModel()
        getPosts()
    }
    
    //MARK: - Private methods
    
    @objc private func tappedSearchButton() {
        presenter?.router?.showSearchModule()
    }
}

//MARK: - Private methods

private extension MainViewController {
    func configureAppearance() {
        navigationItem.setRightBarButton(searchButton, animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCell(MainItemCell.self)
        collectionView.contentInset = .init(top: Constants.verticalInset,
                                            left: Constants.horizontalInset,
                                            bottom: Constants.verticalInset,
                                            right: Constants.horizontalInset)
    }
    
    func configureModel() {
        self.presenter?.model.didItemsUpdated = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
    }
    
    func getPosts() {
        spinnerView.startAnimating()
        presenter?.loadPosts({ [weak self] in
            guard let self = self else {
                return
            }
            self.collectionView.reloadData()
            self.spinnerView.stopAnimating()
        })
    }
}

//MARK: - UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.model.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainItemCell", for: indexPath) as? MainItemCell else {
            fatalError()
        }
        cell.configure(item: presenter?.model.items[indexPath.item]) { [weak self] isFavorite in
            self?.presenter?.model.items[indexPath.item].isFavorite = isFavorite
        }
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = presenter?.model.items[indexPath.item] {
            presenter?.showDetail(item: item)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
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

//MARK: - MainViewInput

extension MainViewController: MainViewInput {
    func reload() {
        collectionView.reloadData()
    }
}
