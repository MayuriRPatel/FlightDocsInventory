//
//  PartsViewController.swift
//  FlightDocsInventory
//
//  Created by PRADIP on 2021-06-15.
//

import UIKit

class PartsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    private var parts = [Parts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.register(UINib(nibName: "PartsTableViewCell", bundle: nil), forCellReuseIdentifier: Cell.partsCell)
        tableView.estimatedRowHeight = 130
        
        fetchData()
    }

    @IBAction func rightBarButtonPressed(_ sender: Any) {
        if let addNewPartVC =
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewPartViewController") as? AddNewPartViewController, let navigationController = navigationController {
            navigationController.pushViewController(addNewPartVC, animated: true)
        }
    }
    
    private func fetchData() {
        FlightDocsAPIService.shared.getAppParts() { result in
            switch result {
            case .success(let parts) :
                for part in parts {
                    self.parts.append(part as! Parts)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension PartsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.partsCell) as! PartsTableViewCell
        cell.displayInformation(part: parts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(parts[indexPath.row])
    }
}

