//
//  NetworkRequest.swift
//  TableViewArchitecture
//
//  Created by Dima Dobrovolskyy on 5/16/19.
//  Copyright © 2019 Dima Dobrovolskyy. All rights reserved.
//

import Foundation

class NetworkRequest {
    
    // MARK: - Properties
    private let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
    private let url: URL
    
    // MARK: - Initializers
    init(url: URL) {
        self.url = url
    }
    
    // MARK: - API methods
    func execute(withCopletion completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
            
        }.resume()
    }
    
}
