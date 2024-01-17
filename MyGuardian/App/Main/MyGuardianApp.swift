//
//  MyGuardianApp.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import SwiftUI
import JailbreakDetector

@main
struct MyGuardianApp: App {
    
    let assembler: Assembler = AppAssembler.shared
    let detector = JailbreakDetector()
    var body: some Scene {
        
        let router: EmployeeRouter = assembler.resolve()
        
        WindowGroup {
            if detector.isJailbroken() {
                EmptyView()
            } else {
                ContentView(router: router)
            }
        }
    }
}

