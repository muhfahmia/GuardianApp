//
//  APIFactory.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

enum APIHTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol APIFactory {
    var baseURL: URL { get }
    var path: String { get }
    var method: APIHTTPMethod { get }
    var body: [String: String]? { get}
}
