//
//  Mocks.swift
//  FalabellaFinancieroTestTests
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/14/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation
@testable import FalabellaFinancieroTest

struct MockData {
    static let mockUser = Session(userName: "user1", password: "p123456")
    
    static let mockStore = StoreData(siteName: "QUILLOTA", countyName: "QUILLOTA", storePhone: "+5633269467", storeName: "CRUZ VERDE ", storeWorkDay: "jueves", storeOpenTime: "08:30:00", storeClosetime: "21:30:00", storeAddress: "OHIGGINS 195, LOCAL 1")
}

