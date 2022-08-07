//
//  MainViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 03/08/22.
//

import UIKit

class MainViewController: UIViewController, ModuleTransitionable {
    
    //MARK: - Views
    
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: MainViewOutput?
    private lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: "SearchIcon"),
                                     style: .done,
                                     target: self,
                                     action: #selector(tappedSearchButton))
        button.tintColor = .black
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    //MARK: - Private methods
    
    @objc private func tappedSearchButton() {
        print("Search in MainVC")
    }
}

//MARK: - Private methods

private extension MainViewController {
    func configureAppearance() {
        navigationItem.setRightBarButton(searchButton, animated: true)
        collectionView.dataSource = self
        collectionView.registerCell(MainItemCell.self)
    }
    
    func configureModel() {
        self.presenter?.model.didItemsUpdated = { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadData()
        }
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
        cell.backgroundColor = .red
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
}

//MARK: - MainViewInput

extension MainViewController: MainViewInput {
    
}
