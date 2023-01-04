//
//  CountryViewController.swift
//  PlacesToGoApp
//
//  Created by Evren Akgün on 27.12.2022.
//

import UIKit
import CoreData

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var idArray = [UUID]()
    var nameArray = [String]()
    var selectedCountryName = ""
    var selectedCountryUUID : UUID?
    
    let cell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    // Mekan eklendikten sonra gelen newData notification'ıyla beraber güncellemeyi yapmasını sağlayan fonksiyon.
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
    // Mekan ekleme butonu
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonAction))
    }
    
    // Ülke verilerini alacağımız fonksiyon
    @objc func getData() {
        
        // Listede aynı yer birden fazla defa çıkmasın diye.
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Countries")
        // False yaparsan büyük verilerle çalışırken caching mekanizmasından da yararlanabilirsin.
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let name = result.value(forKey: "name") as? String {
                        nameArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        idArray.append(id)
                    }
                }
            }
            
            // Tabloyu güncellemek için
            tableView.reloadData()
            
        } catch {
            print("Hata!")
        }
    }
    
    // Mekan ekleme butonunun aksiyonu
    @objc func addButtonAction() {
        performSegue(withIdentifier: "toAddPlacesVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell.textLabel?.text = nameArray[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesVC" {
            let destinationVC = segue.destination as! CityViewController
            destinationVC.selectedCityName = selectedCountryName
            destinationVC.selectedCityUUID = selectedCountryUUID
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountryName = nameArray[indexPath.row]
        selectedCountryUUID = idArray[indexPath.row]
        performSegue(withIdentifier: "toCitiesVC", sender: nil)
    }

}
