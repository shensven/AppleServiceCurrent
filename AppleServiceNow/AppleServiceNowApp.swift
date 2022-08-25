//
//  AppleServiceNowApp.swift
//  AppleServiceNow
//
//  Created by SvenFE on 2022/8/19.
//

import SwiftUI

@main
struct AppleServiceNowApp: App {
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
