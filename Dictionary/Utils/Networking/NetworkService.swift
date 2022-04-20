//
//  NetworkService.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = endpoint.url else { completion(.failure(NSError())); return }
        print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            completion(.success(data))
        }.resume()
    }
}
