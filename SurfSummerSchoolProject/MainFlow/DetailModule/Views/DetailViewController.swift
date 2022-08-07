//
//  DetailViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 07/08/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Property
    
    var presenter: DetailViewOutput?

    //MARK: - Views
    
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

//MARK: - Private methods

private extension DetailViewController {
    func configureAppearance() {
        navigationController?.configureBackBarItem(image: UIImage(named: "BackImage"))
        tableView.backgroundColor = .green
    }
}

//MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    
}
