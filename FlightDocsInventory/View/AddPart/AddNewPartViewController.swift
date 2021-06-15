//
//  AddNewPartViewController.swift
//  FlightDocsInventory
//
//  Created by PRADIP on 2021-06-15.
//

import UIKit

class AddNewPartViewController: UIViewController {
    
    lazy var viewModel: AddNewPartViewModel = AddNewPartViewModel()

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var isActive: UITextField!
    @IBOutlet weak var inStock: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var partNumber: UITextField!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var partDescription: UITextView!
    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func saveDetailsPressed(_ sender: Any) {
        let partsDictionary = ["cost": cost.text,"name": name.text, "partNumber": partNumber.text, "partDescription": partDescription.text, "inStock": (inStock.text), "image": nil, "isActive": isActive.text,"notes": notes.text]
       
        viewModel.addNewPart(parts: partsDictionary as Dictionary<String, Any>) {_ in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
