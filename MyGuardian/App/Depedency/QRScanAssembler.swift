//
//  QRScanAssembler.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 16/01/24.
//

import Foundation

protocol QRScanAssembler {
    func resolve() -> QRScanPresenter
}

extension QRScanAssembler where Self: Assembler {
    func resolve() -> QRScanPresenter {
        QRScanPresenter()
    }
}
