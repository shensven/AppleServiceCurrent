//
//  DeveloperView.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/8/30.
//

import SwiftUI

var devService = [
    ServiceStatus(name: "Account"),
    ServiceStatus(name: "APNS"),
    ServiceStatus(name: "APNS Sandbox"),
    ServiceStatus(name: "App Attest"),
    ServiceStatus(name: "App Store - In-App Purchases"),
    ServiceStatus(name: "App Store - Receipt Verification"),
    ServiceStatus(name: "App Store - Sandbox"),
    ServiceStatus(name: "App Store - Server APIs"),
    ServiceStatus(name: "App Store - Server Notifications"),
    ServiceStatus(name: "App Store - TestFlight"),
    ServiceStatus(name: "App Store Automatic App Updates"),
    ServiceStatus(name: "App Store Connect"),
    ServiceStatus(name: "App Store Connect - App Processing"),
    ServiceStatus(name: "App Store Connect - App Upload"),
    ServiceStatus(name: "App Store Connect Analytics"),
    ServiceStatus(name: "App Store Connect API"),
    ServiceStatus(name: "Apple Developer Forums"),
    ServiceStatus(name: "Apple Maps API"),
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
