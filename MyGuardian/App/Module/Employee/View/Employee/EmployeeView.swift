//
//  HomeView.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct EmployeeView: View {
    @StateObject var vm: EmployeePresenter
    @State var showAdd: Bool = false
    @State var showUpdate: Bool = false
    @State var showAlertDelete: Bool = false
    @State var employeeDelete: Employee = .init()
    let router: EmployeeRouter
    
    var body: some View {
        NavigationView {
            ZStack {
                if vm.isLoading {
                    progressView
                } else if vm.allEmployee.isEmpty {
                    Text("Empty Employee")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.red)
                } else {
                    List(vm.allEmployee, id: \.empID) { emplo in
                        HStack {
                            HStack {
                                AnimatedImage(url: URL(string: emplo.profileImage))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .cornerRadius(37.5)
                                VStack(alignment: .leading) {
                                    Text(emplo.name)
                                        .font(.headline)
                                    Text(emplo.job)
                                        .font(.subheadline)
                                }
                            }
                            Spacer()
                            
                            Image(systemName: "trash.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.red)
                                .opacity(0.65)
                                .frame(width: 45, height: 45)
                                .onTapGesture {
                                    employeeDelete = emplo
                                    showAlertDelete = true
                                }
                        }
                        .tint(.black)
                        .onTapGesture {
                            vm.employee = emplo
                            showUpdate.toggle()
                        }
                    }
                    .fullScreenCover(isPresented: $showUpdate) {
                        router.routeToEmployeeUpdate(vm: vm)
                    }
                    .alert(isPresented: $showAlertDelete) {
                        Alert(
                            title: Text("Are you sure you want to delete this?"),
                            message: Text("There is no undo"),
                            primaryButton: .destructive(Text("Delete")) {
                                vm.deleteEmployee(emp: employeeDelete)
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
            .navigationTitle("Employee")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAdd.toggle()
                    } label: {
                        Image(systemName: "person.badge.plus")
                    }
                    .fullScreenCover(isPresented: $showAdd, content: {
                        router.routeToEmployeeAdd(vm: vm)
                    })
                }
            }
            .onAppear {
                    vm.getEmployee()
            }
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
    let assembler = AppAssembler.shared
    let presenter: EmployeePresenter = assembler.resolve()
    let router: EmployeeRouter = assembler.resolve()
    return EmployeeView(vm: presenter, router: router)
}
