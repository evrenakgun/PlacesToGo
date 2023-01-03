//
//  SignInViewController.swift
//  PlacesToGoApp
//
//  Created by Evren Akgün on 27.12.2022.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
        
    }
    
    // Return tuşuna basıldığında klavyenin kapanmasını sağlayan kod.
    private func configureTextFields() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
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
    
    // Giriş yap butonuna tıklandığında:
    @IBAction func signInButtonAction(_ sender: Any) {
        
    }
    
    
}
