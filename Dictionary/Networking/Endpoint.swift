//
//  Endpoint.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 20.04.2022.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "dictionary.skyeng.ru"
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
    
    static func searchWord(word: String, page: Int, pageSize: Int) -> Endpoint {
        return Endpoint(path: "/api/public/v1/words/search", queryItems: [
            URLQueryItem(name: "search", value: "\(word)"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "pageSize", value: "\(pageSize)")])
    }
    
    static func meanings(id: Int) -> Endpoint {
        return Endpoint(path: "/api/public/v1/meanings", queryItems: [
            URLQueryItem(name: "ids", value: "\(id)")])
    }
}
