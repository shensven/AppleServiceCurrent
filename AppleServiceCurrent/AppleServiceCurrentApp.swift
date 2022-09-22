//
//  AppleServiceCurrentApp.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/8/30.
//

import SwiftUI

@main
struct AppleServiceCurrentApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                BasicView()
                    .badge(2)
                    .tabItem {
                        Label("Basic", systemImage: "command")
                    }

                DeveloperView()
                    .tabItem {
                        Label("Developer", systemImage: "xserve")
                    }
            }
        }
    }
}
