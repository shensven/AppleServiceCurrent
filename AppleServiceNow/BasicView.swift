//
//  BasicView.swift
//  AppleServiceNow
//
//  Created by SvenFE on 2022/8/24.
//

import SwiftUI

struct BasicView: View {
    @State var showSheet = false

    var body: some View {
        NavigationView {
            ScrollView {
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.blue)
                    .padding()
                    .frame(height: 1000)
            }

            .navigationTitle("Basic")
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

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        BasicView()
    }
}
