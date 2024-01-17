//
//  QRScanPresenter.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 16/01/24.
//

import Foundation
import AVFoundation

class QRScanPresenter: ObservableObject {
    
    @Published var isGrant: Bool = false
    @Published var stringQR: String = ""
    
    func checkCameraPermission() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch cameraAuthorizationStatus {
        case .authorized:
            isGrant = true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                self.isGrant = true
            }
        case .denied, .restricted:
            isGrant = false
        @unknown default:
            isGrant = false
        }
    }
    
}
