//
//  SystemStatus.swift
//  AppleServiceCurrent
//
//  Created by SvenFE on 2022/9/1.
//

import Foundation

struct SystemStatus: Decodable {
    var drpost: Bool
    var drMessage: String
    var services: [Services]

    struct Services: Identifiable, Decodable {
        var id: UUID
        var redirectUrl: String
        var serviceName: String
        var events: [Event]

        struct Event: Identifiable, Decodable {
            var id: UUID
            var usersAffected: String
            var epochStartDate: Int
            var epochEndDate: Int
            var messageId: String
            var statusType: String
            var datePosted: String
            var startDate: String
            var endDate: String
            var eventStatus: String
            var message: String
        }
    }
}
