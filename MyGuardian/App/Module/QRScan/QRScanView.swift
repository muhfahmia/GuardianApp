//
//  QRScan.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 16/01/24.
//

import SwiftUI
import CodeScanner
import AVFoundation

struct QRScanView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: QRScanPresenter
    @State var isPresentingScanner: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Scan QR") {
                    isPresentingScanner.toggle()
                }
                if vm.stringQR != "" {
                    Text("QR Result")
                        .padding(.top, 20)
                    Text(vm.stringQR)
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                }
            }
            .navigationTitle("QRScan")
            .onAppear {
                vm.checkCameraPermission()
            }
            .sheet(isPresented: $isPresentingScanner) {
                if vm.isGrant {
                    VStack {
                        Text("Scan your QR")
                            .font(.title)
                        CodeScannerView(codeTypes: [.qr]) { response in
                            if case let .success(result) = response {
                                vm.stringQR = result.string
                                isPresentingScanner = false
                            }
                        }
                        .frame(width: 300, height: 300)
                        .cornerRadius(25)
                    }
                } else {
                    Text("Please enable your camera in the Settings")
                    Link("Open settings", destination: URL(string: UIApplication.openSettingsURLString)!)
                        .onTapGesture {
                            dismiss()
                        }
                    
                }
            }
        }
    }
    
    
}

#Preview {
    let presenter: QRScanPresenter = AppAssembler.shared.resolve()
    return QRScanView(vm: presenter)
}
