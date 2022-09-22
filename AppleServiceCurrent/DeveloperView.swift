//
//  DeveloperView.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/8/30.
//

import SwiftUI

var devService = [
    ServiceName(name: "Account"),
    ServiceName(name: "APNS"),
    ServiceName(name: "APNS Sandbox"),
    ServiceName(name: "App Attest"),
    ServiceName(name: "App Store - In-App Purchases"),
    ServiceName(name: "App Store - Receipt Verification"),
    ServiceName(name: "App Store - Sandbox"),
    ServiceName(name: "App Store - Server APIs"),
    ServiceName(name: "App Store - Server Notifications"),
    ServiceName(name: "App Store - TestFlight"),
    ServiceName(name: "App Store Automatic App Updates"),
    ServiceName(name: "App Store Connect"),
    ServiceName(name: "App Store Connect - App Processing"),
    ServiceName(name: "App Store Connect - App Upload"),
    ServiceName(name: "App Store Connect Analytics"),
    ServiceName(name: "App Store Connect API"),
    ServiceName(name: "Apple Developer Forums"),
    ServiceName(name: "Apple Maps API"),
]

struct DeveloperView: View {
    @State var showSheet = false

    var body: some View {
        NavigationView {
            List(devService) { item in
                NavigationLink(destination: DetailView()) {
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 14, height: 14)
                        Text(item.name)
                            .lineLimit(1)
                            .font(.system(size: 15))
                    }
                }
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
