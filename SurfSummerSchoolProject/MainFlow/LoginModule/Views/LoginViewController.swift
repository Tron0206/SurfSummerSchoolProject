//
//  LoginViewController.swift
//  SurfSummerSchoolProject
//
//  Created by Zhasur Sidamatov on 19/08/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Views
    
    private let loginTextField: CustomTextField = {
        let tf = CustomTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.configure(title: "Логин")
        tf.textField.keyboardType = .phonePad
        
        return tf
    }()
    
    private lazy var loginWarningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Поле не может быть пустым"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = Color.warningRed
        
        return label
    }()
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.configure(title: "Пароль", isPassword: true)
        tf.textField.keyboardType = .alphabet
        tf.textField.autocorrectionType = .no
        
        return tf
    }()
    
    private lazy var passwordWarningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Поле не может быть пустым"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = Color.warningRed
        
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.tintColor = .white
        button.configuration = .none
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitle("Войти", for: .normal)
        
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вход"
        configureAppearance()
    }
}

//MARK: - Private methods

private extension LoginViewController {
    func configureAppearance() {
        configureLoginTextField()
        configureLoginWarningLabel()
        configurePasswordTextField()
        configurePasswordWarningLabel()
        configureLoginButton()
    }
    
    func configureLoginTextField() {
        view.addSubview(loginTextField)
        loginTextField.setDelegate(self, tag: 1)
        NSLayoutConstraint.activate([loginTextField.heightAnchor.constraint(equalToConstant: 55),
                                     loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     loginTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                                     loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
    }
    
    func configureLoginWarningLabel() {
        view.addSubview(loginWarningLabel)
        NSLayoutConstraint.activate([loginWarningLabel.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
                                     loginWarningLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 8)])
    }
    
    func configurePasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.setDelegate(self, tag: 2)
        NSLayoutConstraint.activate([passwordTextField.heightAnchor.constraint(equalToConstant: 55),
                                     passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     passwordTextField.topAnchor.constraint(equalTo: loginWarningLabel.bottomAnchor, constant: 16),
                                     passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
                                     passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor)])
    }
    
    func configurePasswordWarningLabel() {
        view.addSubview(passwordWarningLabel)
        NSLayoutConstraint.activate([passwordWarningLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
                                     passwordWarningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8)])
    }
    
    func configureLoginButton() {
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
                                     loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
                                     loginButton.topAnchor.constraint(equalTo: passwordWarningLabel.bottomAnchor, constant: 32),
                                     loginButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                
                index = numbers.index(after: index)
                
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1 {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = format(with: "+X (XXX) XXX XX XX", phone: newString)
            print(newString)
            return false
        }
        return true
    }
}
