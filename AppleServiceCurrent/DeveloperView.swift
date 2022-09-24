//
//  DeveloperView.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/8/30.
//

import Alamofire
import SwiftUI
import SwiftyJSON

struct DeveloperView: View {
    @State var showSheet = false
    @State var devService: [SystemStatus.Services] = []

    private func fetchStatus() {
        let request = AF.request("https://www.apple.com/support/systemstatus/data/developer/system_status_en_US.js")

        request.responseString { response in
            switch response.result {
            case let .success(value):
                var trimmedJsonString: String = value.substring(
                    from: "jsonCallback(".endIndex
                )
                trimmedJsonString = trimmedJsonString.substring(
                    to: trimmedJsonString.index(
                        trimmedJsonString.endIndex,
                        offsetBy: -2
                    )
                )
                let trimmedJsonStringData: Data = trimmedJsonString.data(using: .utf8)!
                let json = JSON(trimmedJsonStringData)

                let services = json["services"].arrayValue

                self.devService = services.map {
                    SystemStatus.Services(
                        id: UUID(),
                        redirectUrl: $0["redirectUrl"].stringValue,
                        serviceName: $0["serviceName"].stringValue,
                        events: $0["events"].arrayValue.map {
                            SystemStatus.Services.Event(
                                id: UUID(),
                                usersAffected: $0["usersAffected"].stringValue,
                                epochStartDate: $0["epochStartDate"].intValue,
                                epochEndDate: $0["epochEndDate"].intValue,
                                messageId: $0["messageId"].stringValue,
                                statusType: $0["statusType"].stringValue,
                                datePosted: $0["datePosted"].stringValue,
                                startDate: $0["startDate"].stringValue,
                                endDate: $0["endDate"].stringValue,
                                eventStatus: $0["eventStatus"].stringValue,
                                message: $0["message"].stringValue
                            )
                        }
                    )
                }

            case let .failure(error):
                print(error)
            }
        }
    }

    var body: some View {
        NavigationView {
            List(devService) { item in
                ZStack {
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 14, height: 14)
                        Text(item.serviceName)
                            .lineLimit(1)
                            .font(.system(size: 15))
                        Spacer()
                        if item.events.count != 0 {
                            Text("\(item.events.count)")
                                .lineLimit(1)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                                .padding(.trailing, 16)
                        }
                    }
                    if item.events.count != 0 {
                        NavigationLink(destination: DetailView()) {}
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
            ).onAppear {
                fetchStatus()
            }
        }
    }
}

struct DeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperView()
    }
}
