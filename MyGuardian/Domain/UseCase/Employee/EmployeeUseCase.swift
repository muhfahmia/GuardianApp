//
//  EmployeeUseCase.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

protocol EmployeeUseCase {
    func list(completion: @escaping (Result<[Employee], Error>) -> Void)
    func add(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func update(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func detail(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func delete(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
}

struct EmployeeInteractor: EmployeeUseCase {
    
    let repository: EmployeeRepository
    
    init(repository: EmployeeRepository) {
        self.repository = repository
    }
    
    func list(completion: @escaping (Result<[Employee], Error>) -> Void) {
        repository.list { completion($0) }
    }
    
    func add(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        repository.add(employee: employee) { completion($0) }
    }
    
    func update(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        repository.update(employee: employee) { completion($0) }
    }
    
    func detail(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        repository.detail(employee: employee) { completion($0) }
    }
    
    func delete(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        repository.delete(employee: employee) { completion($0) }
    }
    
}
