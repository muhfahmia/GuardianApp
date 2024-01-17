//
//  EmployeeAddView.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 16/01/24.
//

import SwiftUI

struct EmployeeAddView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: EmployeePresenter
    @State var employee: Employee = .init()
    @State var showAlertValidation: Bool = false
    
    init(vm: EmployeePresenter) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        LazyVStack(spacing: 25) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .tint(.red)
                    .frame(width: 20, height: 20)
                
            })
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .offset(y: -25)
            Text("Add Employee")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter your Name", text: $employee.name)
                .textFieldStyle(.roundedBorder)
            TextField("Enter your Job", text: $employee.job)
                .textFieldStyle(.roundedBorder)
            
            Button("Submit") {
                if !employee.name.isEmpty && !employee.job.isEmpty {
                    self.vm.addEmployee(emp: employee)
                    dismiss()
                } else {
                    showAlertValidation.toggle()
                }
            }
            .tint(.black)
            .buttonStyle(.bordered)
            .alert("Please fill form value needed", isPresented: $showAlertValidation) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding(.horizontal, 40)
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    let presenter: EmployeePresenter = AppAssembler.shared.resolve()
    return EmployeeAddView(vm: presenter)
}
