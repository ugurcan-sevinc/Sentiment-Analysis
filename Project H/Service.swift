//
//  Service.swift
//  MLC Waikiki
//
//  Created by Uğurcan Sevinç on 24.12.2022.
//

import Foundation
import Alamofire

struct Model: Decodable {
    var data: Bool?
}

class Service {
    var data: Bool?
    
    func getResult(message: String, completion: @escaping (Model) -> Void) {
        let url = "http://192.168.43.209:5000/predict"
        let parameters = ["key": message]
        AF.request(url, method: .post, parameters: parameters, encoder: .json).validate().responseDecodable(of: Model.self) { response in
            if let response = response.value {
                self.data = response.data
                completion(response)
            } else {
                print("Error getting response from server")
            }
        }
    }
}

