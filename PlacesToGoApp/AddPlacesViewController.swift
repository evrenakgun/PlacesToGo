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
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var commentaryTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureTapGesture()
        imageTapGesture()
    }
    
    // Return tuşuna basıldığında klavyenin kapanmasını sağlayan kod.
    private func configureTextFields() {
        countryTextField.delegate = self
        cityTextField.delegate = self
        districtTextField.delegate = self
        nameTextField.delegate = self
        addressTextField.delegate = self
        commentaryTextField.delegate = self
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
    
    // Görseli interaktif hale getirmeyi sağlayan kod.
    func imageTapGesture() {
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    }
    
    // Görsel seçmeyi sağlayan kod.
    @objc func selectImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Görsel seçmeyi bitirdiğini anlayıp kütüphaneyi kapatan kod.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    // Mekan ekleme ekranındaki "Ekle" butonunun fonksiyonu.
    @IBAction func addButtonAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let placeCountry = NSEntityDescription.insertNewObject(forEntityName: "Countries", into: context)
        let placeCity = NSEntityDescription.insertNewObject(forEntityName: "Cities", into: context)
        let placeDistrict = NSEntityDescription.insertNewObject(forEntityName: "Districts", into: context)
        let place = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        placeCountry.setValue(UUID(), forKey: "id")
        placeCountry.setValue(countryTextField.text!, forKey: "name")
        
        placeCity.setValue(UUID(), forKey: "id")
        placeCity.setValue(cityTextField.text!, forKey: "name")
        
        placeDistrict.setValue(UUID(), forKey: "id")
        placeDistrict.setValue(districtTextField.text!, forKey: "name")
        
        place.setValue(UUID(), forKey: "id")
        place.setValue(nameTextField.text!, forKey: "name")
        place.setValue(addressTextField.text!, forKey: "address")
        place.setValue(commentaryTextField.text!, forKey: "commentary")
        
        let imageData = imageView.image!.jpegData(compressionQuality: 0.5)
        place.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
            print("Kayıt edildi.")
        } catch {
            print("Hata!")
        }
        
    }
    

}
