//
//  APIManager.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func fetchData<T: Decodable>(baseAPI: APIFactory, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        var url = baseAPI.baseURL
        url.appendPathComponent(baseAPI.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = baseAPI.method.rawValue
        if let body = baseAPI.body {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted) else {
                print("Something is wrong while converting dictionary to JSON data.")
                return
            }
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
        }
        
        let task =  URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(APIError.connectionError))
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(APIError.failedMappingError))
                }
            }
        }
        task.resume()
    }
}
