//
//  HomePresenter.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

class EmployeePresenter: ObservableObject {
    
    @Published var allEmployee: [Employee] = []
    @Published var employee: Employee = .init()
    @Published var isLoading: Bool = false
    let employeeUseCase: EmployeeUseCase
    
    init(employeeUseCase: EmployeeUseCase) {
        self.employeeUseCase = employeeUseCase
    }
    
    func getEmployee() {
        isLoading = true
        employeeUseCase.list { result in
            switch result {
            case .success(let data):
                self.allEmployee = data
                self.isLoading = false
            case .failure(_):
                self.isLoading = false
            }
        }
    }
    
    func addEmployee(emp: Employee) {
        employeeUseCase.add(employee: emp) { result in
            switch result {
            case .success(_):
                self.getEmployee()
            case .failure(_):break
            }
        }
    }
    
    func detailEmployee(emp: Employee) {
        employeeUseCase.detail(employee: emp) { result in
            switch result {
            case .success(let data):
                self.employee = data
            case .failure(_):break
            }
        }
    }
    
    func updateEmployee(emp: Employee) {
        employeeUseCase.update(employee: emp) { result in
            switch result {
            case .success(_):
                self.getEmployee()
            case .failure(_):break
            }
        }
    }
    
    func deleteEmployee(emp: Employee) {
        employeeUseCase.delete(employee: emp) { result in
            switch result {
            case .success(_):
                self.getEmployee()
            case .failure(_):break
            }
        }
    }
    
}
