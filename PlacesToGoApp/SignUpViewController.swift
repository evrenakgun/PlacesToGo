//
//  SignUpViewController.swift
//  PlacesToGoApp
//
//  Created by Evren Akgün on 27.12.2022.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
        
    }
    
    // Return tuşuna basıldığında klavyenin kapanmasını sağlayan kod.
    private func configureTextFields() {
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        passwordAgainTextField.delegate = self
    }
    
    // Return tuşuna basıldığında klavyenin kapanmasını sağlayan kod.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Ekranda herhangi bir yere tıklandığında klavyeyi kapatmayı sağlayan kod.
    private func configureTapGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    // Ekranda herhangi bir yere tıklandığında klavyeyi kapatmayı sağlayan kod.
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    // Kayıt ol butonuna tıklandığında:
    @IBAction func signUpButtonAction(_ sender: Any) {
        view.endEditing(true)
    }
    
}
