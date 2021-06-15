//
//  FlightDocsAPIService.swift
//  FlightDocsInventory
//
//  Created by PRADIP on 2021-06-15.
//

import Foundation

typealias Request = (Result<Array<Any>, NetwrokError>) -> Void
class FlightDocsAPIService {
    
    static let shared = FlightDocsAPIService()
    private let urlSession = URLSession.shared
    private let baseURL = URL(string: "http://localhost:9001")!
    
    func getAppParts(completion: @escaping Request) {
        let partsURL = baseURL.appendingPathComponent("/parts")
        urlSession.dataTask(with: partsURL) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.badError))
                return
            }
            
            do {
                let jsonObject = try JSONDecoder().decode([Parts].self,from: data)
                completion(.success(jsonObject))
            } catch {
                completion(.failure(.badError))
            }
        }.resume()
    }
    
    func addNewPart(parts: Dictionary<String, Any>, completion: @escaping Request) {
    
        let partsURL = baseURL.appendingPathComponent("/parts")
        var request = URLRequest(url: partsURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let newPart = NewParts(cost: (parts["cost"] as! NSString).floatValue, name: parts["name"] as! String, partNumber: parts["partNumber"] as! String, description: parts["partDescription"] as! String, inStock: 55, image: nil, isActive: (parts["isActive"] != nil), notes: parts["notes"] as! String)
        
        do {
            let jsonData = try JSONEncoder().encode(newPart)
            request.httpBody = jsonData
        } catch {
           print("encode failure")
        }
       
        urlSession.dataTask(with: partsURL) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.badError))
                return
            }
            do {
                let jsonObject = try JSONDecoder().decode([NewPart].self,from: data)
                completion(.success([jsonObject]))
            } catch {
                completion(.failure(.badError))
            }
        }.resume()
    }
    
    func editExistingPart() {
//        http://localhost:9001/parts
//        PATH PARAMETERS - id
//        {
//        "cost": 0,
//        "partNumber": "string",
//        "description": "string",
//        "name": "string",
//        "notes": "string",
//        "inStock": 0,
//        "image": { },
//        "isActive": true
//        }
    }
    
    func consumeExistingPart() {
//        http://localhost:9001/parts/{id}/consume
//        {
//        "quantity": 0
//        }
    }
    
    func receiveNewPart() {
       // http://localhost:9001/parts/{id}/receive
//        {
//        "quantity": 0
//        }
    }

}
