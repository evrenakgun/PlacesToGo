//
//  DistrictViewController.swift
//  PlacesToGo
//
//  Created by Evren Akgün on 4.01.2023.
//

import UIKit

class DistrictViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell.textLabel?.text = "test"
        
        return cell
    }

}
