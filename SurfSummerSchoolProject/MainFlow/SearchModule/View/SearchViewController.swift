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
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.layer.cornerRadius = 18
        searchBar.searchTextField.clipsToBounds = true
        searchBar.searchTextField.placeholder = "Поиск"
        searchBar.sizeToFit()
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

//MARK: - Private method

private extension SearchViewController {
    func configureAppearance() {
        navigationItem.titleView = searchBar
        navigationController?.configureBackBarItem(image: UIImage(named: "BackImage"))
    }
}

//MARK: - SearchViewInput

extension SearchViewController: SearchViewInput {
    
}
