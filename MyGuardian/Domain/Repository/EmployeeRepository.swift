//
//  EmployeeRepository.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

protocol EmployeeRepository {
    func list(completion: @escaping (Result<[Employee], Error>) -> Void)
    func add(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func detail(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func update(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
    func delete(employee: Employee, completion: @escaping (Result<Employee, Error>) -> Void)
}
