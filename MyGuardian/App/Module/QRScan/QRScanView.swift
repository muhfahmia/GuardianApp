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
    
    @ObservedObject var vm: QRScanPresenter
    @State var isPresentingScanner: Bool = false
    
    var body: some View {
        NavigationStack {
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
                CodeScannerView(codeTypes: [.qr]) { response in
                    if case let .success(result) = response {
                        vm.stringQR = result.string
                        isPresentingScanner = false
                    }
                }
            }
        }
    }
    
    
}

//#Preview {
//    QRScanView()
//}
