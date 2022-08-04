//
//  MainViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 03/08/22.
//

import UIKit

class MainViewController: UIViewController {
    
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
        navigationItem.setRightBarButton(searchButton, animated: true)
    }
    
    @objc private func tappedSearchButton() {
        print("Search in MainVC")
    }
}
