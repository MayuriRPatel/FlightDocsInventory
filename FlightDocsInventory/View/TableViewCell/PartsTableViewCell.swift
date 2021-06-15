//
//  PartsTableViewCell.swift
//  FlightDocsInventory
//
//  Created by PRADIP on 2021-06-15.
//

import UIKit

class PartsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func displayInformation(part: Parts) {
        name.text = "Name: \(part.name)"
        quantity.text = "Total Quantity: \(part.inStock?.description ?? "0")"
    }
    
    @IBAction func consumedPartsPressed(_ sender: Any) {
    }
    @IBAction func editPartsPressed(_ sender: Any) {
    }
    @IBAction func receivedPartsPressed(_ sender: Any) {
    }
}
