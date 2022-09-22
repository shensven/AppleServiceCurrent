//
//  BasicView.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/8/30.
//

import SwiftUI

var basicService = [
    ServiceName(name: "App Store"),
    ServiceName(name: "Apple Account"),
    ServiceName(name: "Apple Arcade"),
    ServiceName(name: "Apple Books"),
    ServiceName(name: "Apple Business Essentials"),
    ServiceName(name: "Apple Business Manager"),
    ServiceName(name: "Apple Card"),
    ServiceName(name: "Apple Cash"),
    ServiceName(name: "Apple Fitness+"),
    ServiceName(name: "Apple ID"),
    ServiceName(name: "Apple Messages for Business"),
    ServiceName(name: "Apple Music"),
    ServiceName(name: "Apple Music for Artists"),
    ServiceName(name: "Apple Music radio"),
    ServiceName(name: "Apple Music Subscriptions"),
    ServiceName(name: "Apple Online Store"),
    ServiceName(name: "Apple Pay & Wallet"),
    ServiceName(name: "Apple School Manager"),
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
