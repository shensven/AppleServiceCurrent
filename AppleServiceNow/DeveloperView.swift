//
//  DeveloperView.swift
//  AppleServiceNow
//
//  Created by SvenFE on 2022/8/24.
//

import SwiftUI

struct DeveloperView: View {
    @State var showSettingsView = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SettingsView(), isActive: $showSettingsView){
                    EmptyView()
                }
                ScrollView{
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.red)
                        .padding()
                        .frame(height:1000)
                }
                .navigationTitle("Developer")
                .navigationBarItems(trailing: Button(action: {
                    self.showSettingsView = true
                }){
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
                )
            }
        }
    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
