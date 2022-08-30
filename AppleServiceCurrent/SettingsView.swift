//
//  SettingsView.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/8/30.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello, Settings!")
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
