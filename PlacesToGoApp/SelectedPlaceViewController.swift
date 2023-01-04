//
//  SelectedPlaceViewController.swift
//  PlacesToGo
//
//  Created by Evren Akgün on 4.01.2023.
//

import UIKit
import CoreData

class SelectedPlaceViewController: UIViewController {
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeCommentaryLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var placeName = ""
    var placeUUID : UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // Mekan verilerini alacağımız fonksiyon
    func getData() {
        if let uuidString = placeUUID?.uuidString {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let name = result.value(forKey: "name") as? String {
                            placeNameLabel.text = name
                        }
                        
                        if let commentary = result.value(forKey: "commentary") as? String {
                            placeCommentaryLabel.text = commentary
                        }
                        
                        if let address = result.value(forKey: "address") as? String {
                            placeAddressLabel.text = address
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
                
            } catch {
                print("Hata!")
            }
            
        }
    }

}
