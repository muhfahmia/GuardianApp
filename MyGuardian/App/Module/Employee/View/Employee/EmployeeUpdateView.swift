//
//  EmployeeAddView.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 16/01/24.
//

import SwiftUI

struct EmployeeUpdateView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: EmployeePresenter
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
            Text("Update Employee")
                .font(.largeTitle)
                .fontWeight(.bold)
            if vm.isLoadingUpdate {
                progressView
            } else {
            
                TextField("Enter your Name", text: $vm.employee.name)
                    .textFieldStyle(.roundedBorder)
                TextField("Enter your Job", text: $vm.employee.job)
                    .textFieldStyle(.roundedBorder)
                
                Button("Submit") {
                    if !vm.employee.name.isEmpty && !vm.employee.job.isEmpty {
                        vm.updateEmployee(emp: vm.employee)
                        dismiss()
                    } else {
                        showAlertValidation.toggle()
                    }
                }
                .tint(.black)
                .buttonStyle(.bordered)
            }
        }
        .padding(.horizontal, 40)
        .padding(.top, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            vm.detailEmployee(emp: vm.employee)
        }
        .alert("Please fill form value needed", isPresented: $showAlertValidation) {
            Button("OK", role: .cancel) { }
        }
    }
    
    var progressView: some View {
        Rectangle()
            .fill(.gray)
            .opacity(0.2)
            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            .cornerRadius(20)
            .overlay(
                ProgressView()
            )
    }
}

#Preview {
    let presenter: EmployeePresenter = AppAssembler.shared.resolve()
    return EmployeeUpdateView(vm: presenter)
}
