//
//  ContentView.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    
    let router: EmployeeRouter
    
    var body: some View {
        TabView {
            router.routeToEmployee()
            .tabItem {
                Label("Employee", systemImage: "person.fill")
            }

            router.routeToQRScan()
            .tabItem {
                Label("QRScan", systemImage: "barcode.viewfinder")
            }
        }
    }
}

#Preview {
    let router: EmployeeRouter = AppAssembler.shared.resolve()
    return ContentView(router: router)
}
