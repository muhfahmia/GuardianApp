//
//  APIs.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

enum APIEmployee {
    case getList
    case add(param: Employee)
    case detail(param: Employee)
    case update(param: Employee)
    case delete(param: Employee)
}

extension APIEmployee: APIFactory {
    var baseURL: URL {
        URL(string: "https://65a514a552f07a8b4a3e503a.mockapi.io/")!
    }
    
    var path: String {
        switch self {
        case .getList, .add:
            return "employee"
        case .detail(let param):
            return "employee/\(param.empID)"
        case .delete(let param):
            return "employee/\(param.empID)"
        case .update(let param):
            return "employee/\(param.empID)"
        }
    }
    
    var method: APIHTTPMethod {
        switch self {
        case .getList, .detail(_):
            return .GET
        case .add:
            return .POST
        case .update(_):
            return .PUT
        case .delete(_):
            return .DELETE
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .add(let param), .update(let param):
            let paramData: [String: String] = [
                "name": param.name,
                "job": param.job
            ]
            return paramData
        default:
            return nil
        }
    }
    
}
