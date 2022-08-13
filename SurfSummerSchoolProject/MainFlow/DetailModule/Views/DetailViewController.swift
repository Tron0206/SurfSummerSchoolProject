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
        title = presenter?.item.title
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerCell(DetailImageCell.self)
        tableView.registerCell(DetailTitleCell.self)
        tableView.registerCell(DetailDescriptionCell.self)
    }
}

//MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailImageCell.self)", for: indexPath) as? DetailImageCell else {
                return UITableViewCell()
            }
            cell.image = presenter?.item.imageUrlString ?? ""
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTitleCell.self)", for: indexPath) as? DetailTitleCell else {
                return UITableViewCell()
            }
            cell.itemTitle = presenter?.item.title
            cell.itemData = presenter?.item.dateCreation
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailDescriptionCell.self)", for: indexPath) as? DetailDescriptionCell else {
                return UITableViewCell()
            }
            cell.descriptionText = presenter?.item.description
            return cell
        default:
            return UITableViewCell()
        }
    }
}
