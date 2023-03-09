//
//  AddPlacesViewController.swift
//  PlacesToGoApp
//
//  Created by Evren Akgün on 28.12.2022.
//

import UIKit
import CoreData

class AddPlacesViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var districtTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
    }
    
    private func configureTextFields() {
        countryTextField.delegate = self
        cityTextField.delegate = self
        districtTextField.delegate = self
        nameTextField.delegate = self
    }
    
    // Return tuşuna basıldığında klavyenin kapanmasını sağlayan kod.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Ekranda herhangi bir yere tıklandığında klavyeyi kapatmayı sağlayan kod.
    func configureTapGesture() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    // Ekranda herhangi bir yere tıklandığında klavyeyi kapatmayı sağlayan kod.
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    // Mekan ekleme ekranındaki "Ekle" butonunun fonksiyonu.
    @IBAction func addButtonAction(_ sender: Any) {
                
    }

}
