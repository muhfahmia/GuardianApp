//
//  Assembler.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 15/01/24.
//

import Foundation

protocol Assembler: EmployeeAssembler, QRScanAssembler {}

class AppAssembler: Assembler {
    static let shared = AppAssembler()
}
