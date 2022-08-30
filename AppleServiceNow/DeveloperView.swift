//
//  DeveloperView.swift
//  AppleServiceNow
//
//  Created by SvenFE on 2022/8/24.
//

import SwiftUI

struct DeveloperView: View {
    @State var showSheet = false

    var body: some View {
        NavigationView {
            ScrollView {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.red)
                    .padding()
                    .frame(height: 1000)
            }
            .navigationTitle("Developer")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSheet = true
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }.sheet(isPresented: $showSheet) {
                    SettingsView()
                }
            )
        }
    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
