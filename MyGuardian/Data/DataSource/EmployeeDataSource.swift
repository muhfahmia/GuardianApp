//
//  EmployeeDataSource.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

protocol EmployeeDataSource {
    func list(completion: @escaping (Result<[Employee], Error>) -> Void)
    func add(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func detail(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func update(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func delete(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
}

struct DefaultEmployeeDataSource: EmployeeDataSource {
    func list(completion: @escaping (Result<[Employee], Error>) -> Void) {
        APIManager.shared.fetchData(baseAPI: APIEmployee.getList, responseType: [Employee].self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func add(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        APIManager.shared.fetchData(baseAPI: APIEmployee.add(param: employee), responseType: Employee.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func detail(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        APIManager.shared.fetchData(baseAPI: APIEmployee.detail(param: employee), responseType: Employee.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func update(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        APIManager.shared.fetchData(baseAPI: APIEmployee.update(param: employee), responseType: Employee.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func delete(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        APIManager.shared.fetchData(baseAPI: APIEmployee.delete(param: employee), responseType: Employee.self) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
