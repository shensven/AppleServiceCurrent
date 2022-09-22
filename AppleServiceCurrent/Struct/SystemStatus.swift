//
//  SystemStatus.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/9/1.
//

import Foundation

struct SystemStatus: Decodable {
    var drpost: String
    var drMessage: String
    var services: [Services]

    struct Services: Identifiable, Decodable {
        var id: UUID
        var redirectUrl: String
        var serviceName: String
        var events: [String]
    }
}
