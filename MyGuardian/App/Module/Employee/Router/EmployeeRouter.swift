//
//  HomeRouter.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

struct EmployeeRouter {
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func routeToQRScan() -> QRScanView {
        QRScanView(vm: assembler.resolve())
    }
    
    func routeToEmployee() -> EmployeeView {
        EmployeeView(vm: assembler.resolve(), router: assembler.resolve())
    }
    
    func routeToEmployeeAdd(vm: EmployeePresenter) -> EmployeeAddView {
        EmployeeAddView(vm: vm)
    }
    
    func routeToEmployeeUpdate(vm: EmployeePresenter) -> EmployeeUpdateView {
        EmployeeUpdateView(vm: vm)
    }
 
}
