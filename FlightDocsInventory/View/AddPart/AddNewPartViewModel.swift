//
//  AddNewPartViewModel.swift
//  FlightDocsInventory
//
//  Created by PRADIP on 2021-06-15.
//

import Foundation

class AddNewPartViewModel {

    func addNewPart(parts: Dictionary<String, Any>, completion: @escaping ((Array<Any>) -> Void)) {
        FlightDocsAPIService.shared.addNewPart(parts: parts) { result in
            switch result {
            case .success(let parts):
                completion(parts)
            case .failure:
                print("error")
                completion([])
            }
        }
    }
}
