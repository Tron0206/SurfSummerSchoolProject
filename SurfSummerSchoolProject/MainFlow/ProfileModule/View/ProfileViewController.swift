//
//  ProfileViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 03/08/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Views
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    //MARK: - Actions
    
    
    @IBAction func tappedLogoutButton(_ sender: Any) {
        print("tappedLogoutButton")
    }
}

//MARK: - Private methods

private extension ProfileViewController {
    func configureAppearance() {
        configureTableView()
        configureLogoutButton()
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.registerCell(HeaderTableViewCell.self)
        tableView.separatorInset = .zero
    }
    
    func configureLogoutButton() {
        logoutButton.backgroundColor = .black
        logoutButton.tintColor = .white
        logoutButton.configuration = .none
        logoutButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        logoutButton.setTitle("Выйти", for: .normal)
    }
}

//MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(HeaderTableViewCell.self)", for: indexPath) as? HeaderTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
            cell.configure(title: "Город", data: "Cанкт-Петербург")
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
            cell.configure(title: "Телефон", data: "+ 7 (961) 187 17 44")
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
            cell.configure(title: "Почта", data: "alexandra@surfstudio.ru")
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {

}


