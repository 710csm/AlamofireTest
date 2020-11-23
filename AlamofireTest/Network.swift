//
//  Network.swift
//  AlamofireTest
//
//  Created by 최승명 on 2020/11/23.
//

import Foundation
import Alamofire

class Network {
    let apiKey = "90e6ba4e-5d7a-491b-8e2a-795013811580"
    static let shared = Network()
    
    class var baseURL: String {
        return "https://api.thecatapi.com"
    }
    
    static var sessionManager: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [ : ]
        configuration.httpAdditionalHeaders?["Accept"] = "application/json"
        return Alamofire.Session(configuration: configuration)
    }()
    
    func getRandomCatPicture(parameters: Parameters, completion: @escaping(_ result : Data) -> (Void)){
        let url = "/v1/images/search"
        let parameters : Parameters = parameters
        Network.sessionManager.request(Network.baseURL + url, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .success(_):
                completion(response.data!)
                break
            case .failure(let error):
                print(error)
                print(response.data!)
                break
            }
            
        }
    }
}
