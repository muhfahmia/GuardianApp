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
    @Published var isLoadingUpdate: Bool = false
    
    private let employeeUseCase: EmployeeUseCase
    
    init(employeeUseCase: EmployeeUseCase) {
        self.employeeUseCase = employeeUseCase
    }
    
    func getEmployee() {
        isLoading = true
        employeeUseCase.list { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.allEmployee = data
                    self.isLoading = false
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
    func addEmployee(emp: Employee) {
        isLoading = true
        employeeUseCase.add(employee: emp) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.allEmployee.append(data)
                    self.isLoading = false
                }
                
            case .failure(_):break
            }
        }
    }
    
    func detailEmployee(emp: Employee) {
        isLoadingUpdate = true
        employeeUseCase.detail(employee: emp) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.employee = data
                    self.isLoadingUpdate = false
                }
            case .failure(_):break
            }
        }
    }
    
    func updateEmployee(emp: Employee) {
        isLoading = true
        employeeUseCase.update(employee: emp) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let row = self.allEmployee.firstIndex(where: {$0.empID == data.empID}) {
                        self.allEmployee[row] = data
                    }
                    self.isLoading = false
                }
            case .failure(_):break
            }
        }
    }
    
    func deleteEmployee(emp: Employee) {
        isLoading = true
        employeeUseCase.delete(employee: emp) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let row = self.allEmployee.firstIndex(where: {$0.empID == data.empID}) {
                        self.allEmployee.remove(at: row)
                    }
                    self.isLoading = false
                }
            case .failure(_):break
            }
        }
    }
    
}
