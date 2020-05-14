//
//  Session.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/14/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation

struct Session: Codable, Equatable {
    var userName: String
    var password: String
}

struct DataMocks{
    static let mockUser: Session = Session(userName: "user1", password: "p123456")
}

