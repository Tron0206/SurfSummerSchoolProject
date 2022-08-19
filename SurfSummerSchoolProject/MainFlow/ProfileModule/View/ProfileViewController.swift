//
//  ProfileViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 03/08/22.
//

import UIKit

final class ProfileViewController: UIViewController, ModuleTransitionable {
    
    //MARK: - Properties
    
    var presenter: ProfileViewOutput?
    
    //MARK: - Views
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    private lazy var spinnerView: SpinnerView = {
        let spinnerView = SpinnerView()
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.isHidden = true
        return spinnerView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    //MARK: - Actions
    
    
    @IBAction func tappedLogoutButton(_ sender: Any) {
        presenter?.showAlertController()
    }
}

//MARK: - Private methods

private extension ProfileViewController {
    func configureAppearance() {
        configureTableView()
        configureLogoutButton()
        configureSpinnerView()
    }
    
    func configureTableView() {
        tableView.dataSource = self
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
    
    func configureSpinnerView() {
        logoutButton.addSubview(spinnerView)
        NSLayoutConstraint.activate([spinnerView.centerXAnchor.constraint(equalTo: logoutButton.centerXAnchor),
                                     spinnerView.centerYAnchor.constraint(equalTo: logoutButton.centerYAnchor),
                                     spinnerView.heightAnchor.constraint(equalToConstant: 24),
                                     spinnerView.widthAnchor.constraint(equalToConstant: 24)])
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

//MARK: - ProfileViewInput

extension ProfileViewController: ProfileViewInput {

    
    func startLoading() {
        spinnerView.startLoading()
        logoutButton.titleLabel?.isHidden = true
    }
    
    func stopLoading() {
        spinnerView.hideLoading()
        logoutButton.titleLabel?.isHidden = false
    }
}
