//
//  BasicView.swift
//  AppleServiceNow
//
//  Created by SvenFE on 2022/8/24.
//

import SwiftUI

var basicService = [
    ServiceStatus(name: "App Store"),
    ServiceStatus(name: "Apple Account"),
    ServiceStatus(name: "Apple Arcade"),
    ServiceStatus(name: "Apple Books"),
    ServiceStatus(name: "Apple Business Essentials"),
    ServiceStatus(name: "Apple Business Manager"),
    ServiceStatus(name: "Apple Card"),
    ServiceStatus(name: "Apple Cash"),
    ServiceStatus(name: "Apple Fitness+"),
    ServiceStatus(name: "Apple ID"),
    ServiceStatus(name: "Apple Messages for Business"),
    ServiceStatus(name: "Apple Music"),
    ServiceStatus(name: "Apple Music for Artists"),
    ServiceStatus(name: "Apple Music radio"),
    ServiceStatus(name: "Apple Music Subscriptions"),
    ServiceStatus(name: "Apple Online Store"),
    ServiceStatus(name: "Apple Pay & Wallet"),
    ServiceStatus(name: "Apple School Manager"),
]

struct BasicView: View {
    @State var showSheet = false

    var body: some View {
        NavigationView {
            List(basicService) { item in
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
