//
//  EmployeeRepository.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

struct DefaultEmployeeRepository: EmployeeRepository {
    
    let dataSource: EmployeeDataSource
    
    init(dataSource: EmployeeDataSource) {
        self.dataSource = dataSource
    }
    
    func list(completion: @escaping (Result<[Employee], Error>) -> Void) {
        dataSource.list { completion($0) }
    }
    
    func add(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        dataSource.add(employee: employee) { completion($0) }
    }
    
    func detail(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        dataSource.detail(employee: employee) { completion($0) }
    }
    
    func update(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        dataSource.update(employee: employee) { completion($0) }
    }
    
    func delete(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void) {
        dataSource.delete(employee: employee) { completion($0) }
    }
}
