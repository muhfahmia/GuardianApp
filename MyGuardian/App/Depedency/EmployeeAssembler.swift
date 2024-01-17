//
//  HomeAssembler.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

protocol EmployeeAssembler {
    func resolve() -> EmployeePresenter
    func resolve() -> EmployeeRouter
    func resolve() -> EmployeeUseCase
    func resolve() -> EmployeeRepository
    func resolve() -> EmployeeDataSource
}

extension EmployeeAssembler where Self: Assembler {
    
    func resolve() -> EmployeePresenter {
        EmployeePresenter(employeeUseCase: resolve())
    }
    
    func resolve() -> EmployeeRouter {
        EmployeeRouter(assembler: self)
    }
    
    func resolve() -> EmployeeUseCase {
        EmployeeInteractor(repository: resolve())
    }
    
    func resolve() -> EmployeeRepository {
        DefaultEmployeeRepository(dataSource: resolve())
    }
    
    func resolve() -> EmployeeDataSource {
        DefaultEmployeeDataSource()
    }
}
