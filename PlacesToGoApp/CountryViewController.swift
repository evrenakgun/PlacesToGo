//
//  CountryViewController.swift
//  PlacesToGoApp
//
//  Created by Evren Akgün on 27.12.2022.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    // Mekan ekleme butonu
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonAction))
    }
    
    // Mekan ekleme butonunun aksiyonu
    @objc func addButtonAction() {
        performSegue(withIdentifier: "toAddPlacesVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell.textLabel?.text = "test"
        
        return cell
    }

}
