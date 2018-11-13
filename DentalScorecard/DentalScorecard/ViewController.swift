//
//  ViewController.swift
//  DentalScorecard
//
//  Created by Julian Cearley on 10/7/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    let inputsContainerView: UIView =  {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailSepartorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220 , g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GSDALogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.white
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ViewController"
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(inputsContainerView)
        self.view.addSubview(loginButton)
        self.view.addSubview(logo)
     
        setupView()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupView() {
        
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 100)
        inputsContainerViewHeightAnchor?.isActive  = true
        
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSepartorView)
        inputsContainerView.addSubview(passwordTextField)
        
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -25).isActive = true
        logo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        logo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        // Constraints need x,y,width,height
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo:  inputsContainerView.topAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
        emailTextFieldHeightAnchor?.isActive = true
        
        // Constraints need x,y,width,height
        emailSepartorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSepartorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSepartorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSepartorView.heightAnchor.constraint(equalToConstant: 1 ).isActive = true
        
        // Constraints need x,y,width,height
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo:  emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
        passwordTextFieldHeightAnchor?.isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 10).isActive = true
        loginButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.04).isActive = true
        
    }
    
    @objc func handleLogin() {
        if let email = emailTextField.text, let password = passwordTextField.text, ((emailTextField.text?.count)! > 0 && (passwordTextField.text?.count)! > 0) {
            AuthService.instance.login(email: email, password: password) { (error, data) in
                guard error == nil else {
                    let alert = UIAlertController(title: "Error Authentication", message: error, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return;
                }
                if error == nil {
                    print("Login Successful")
                    self.present(MainViewController(), animated: true) {}
                } else {
                    let alert = UIAlertController(title: "Username and Password Required", message: "You Must Enter a Username and Password", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }//
    }
    
}
