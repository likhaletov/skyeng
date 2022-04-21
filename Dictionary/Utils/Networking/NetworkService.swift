//
//  NetworkService.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

enum Errors: Error {
    case invalidUrl
    case invalidData
}

protocol NetworkServiceProtocol {
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
    func request(_ endpoint: Endpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = endpoint.url else { completion(.failure(Errors.invalidUrl)); return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { completion(.failure(error)); return }
            guard let response = response as? HTTPURLResponse, response.isSuccess else { return }
            guard let data = data else { completion(.failure(Errors.invalidData)); return }
            completion(.success(data))
        }.resume()
    }
}

extension HTTPURLResponse {
    var isSuccess: Bool {
        return (200...299).contains(self.statusCode)
    }
}
