//
//  APIError.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

enum APIError: Error {
    case badURL, unknown, connectionError, invalidJSONError, failedMappingError
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Invalid URL"
        case .unknown:
          return "An error occurred. Please try again later."
        case .connectionError:
          return "Connection problem. Please check your internet connection."
        case .invalidJSONError:
          return "Service response in an unexpected format."
        case .failedMappingError:
          return "Failed to read server's response."
        }
    }
}
