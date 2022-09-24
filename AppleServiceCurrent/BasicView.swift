//
//  BasicView.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/8/30.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct BasicView: View {
    @State var showSheet = false

    @State var basicService: [SystemStatus.Services] = []

    private func fetchStatus() {
        let request = AF.request("https://www.apple.com/support/systemstatus/data/system_status_en_US.js")

        request.responseJSON { response in
            switch response.result {
            case let .success(value):
                let json = JSON(value)
                let services = json["services"].arrayValue
                self.basicService = services.map {
                    SystemStatus.Services(
                        id: UUID(),
                        redirectUrl: $0["redirectUrl"].stringValue,
                        serviceName: $0["serviceName"].stringValue,
                        events: $0["events"].arrayValue.map(\.stringValue)
                    )
                }
            case let .failure(error):
                print(error)
            }
        }
    }

    var body: some View {
        NavigationView {
            List(basicService) { item in
                NavigationLink(destination: DetailView()) {
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 14, height: 14)
                        Text(item.serviceName)
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
            ).onAppear {
                fetchStatus()
            }
        }
    }
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        BasicView()
    }
}
