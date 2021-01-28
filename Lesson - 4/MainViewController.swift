//
//  MainViewController.swift
//  Lesson - 4
//
//  Created by User on 1/25/21.
//  Copyright © 2021 Syrym Zhursin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "cancel"), for: .normal)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "vk logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email или телефон"
        //textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        textField.setLeftPaddingPoints(10)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        //textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 8
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 243/255, alpha: 1)
        textField.isSecureTextEntry = true
        textField.setLeftPaddingPoints(10)

        
        return textField
    }()
    
    lazy var passwordRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forgot password")
        imageView.contentMode = .scaleAspectFit

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordImageTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageView
    }()
    
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(red: 168/255, green: 194/255, blue: 229/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.textColor = .white
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var enterByAppleView: PrimaryView = {
        let view = PrimaryView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(enterByAppleButtonPressed))
        view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let uiElements = [cancelButton, iconImageView, loginTextField, passwordTextField, enterButton, enterByAppleView, passwordRightImageView]
        uiElements.forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        iconImageView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: view.frame.height * 0.1).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 90).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        enterByAppleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        enterByAppleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enterByAppleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        enterByAppleView.heightAnchor.constraint(equalToConstant: 44).isActive = true

        enterByAppleView.setParameters(imageName: "apple logo", title: "Войти через Apple")
        
        passwordRightImageView.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 6).isActive = true
        passwordRightImageView.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -6).isActive = true
        passwordRightImageView.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10).isActive = true
        passwordRightImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    @objc func enterButtonPressed() {
        print(#function)
    }
    
    @objc func forgotPasswordImageTapped()
    {
        print(#function)
        // Your action
    }
    @objc func cancelButtonPressed() {
        print(#function)
    }
    @objc func enterByAppleButtonPressed() {
        print(#function)
    }
}

