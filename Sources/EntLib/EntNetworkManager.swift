//
//  NetworkManager.swift
//  EntFetcher
//
//  Created by Nikhil Bhawsar on 19/05/24.
//

import Foundation

public class EntNetworkManager {
    
    public static let shared = EntNetworkManager()
    
    private init() {}
    
    public func getRequest(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Data was nil"])
                completion(.failure(error))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}