//
//  URL+Extension.swift
//  Dictionary
//
//  Created by Лихалетов Дмитрий Михайлович on 21.04.2022.
//

import Foundation

public extension URL {
    static func makeUrl(_ string: String) -> URL? {
        guard
            let urlComponents = URLComponents(string: string),
            let host = urlComponents.host
        else { return nil }
        let scheme = urlComponents.scheme ?? "https"
        var resultUrlComponents = URLComponents()
        resultUrlComponents.scheme = scheme
        resultUrlComponents.host = host
        resultUrlComponents.path = urlComponents.path
        return resultUrlComponents.url
    }
}
