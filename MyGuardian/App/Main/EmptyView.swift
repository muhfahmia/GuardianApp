//
//  EmptyView.swift
//  MyGuardian
//
//  Created by Muhammad Fahmi on 17/01/24.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        Text("Your device running on Jailbreak System. Sorry, i can catch you!")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(.red)
    }
}

#Preview {
    EmptyView()
}
