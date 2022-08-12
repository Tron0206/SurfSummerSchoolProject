//
//  SearchViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import UIKit

class SearchViewController: UIViewController {
    
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
        navigationItem.titleView = searchBar
        navigationController?.configureBackBarItem(image: UIImage(named: "BackImage"))
        collectionView.isHidden = true
        configureHelperViewImageView()
        configureHelperViewTitleView()
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
