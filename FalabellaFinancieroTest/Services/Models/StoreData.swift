//
//  StoreData.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/13/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation

struct StoreData: Codable, Equatable {
    
    enum CodingKeys: String, CodingKey {
        case siteName = "localidad_nombre"
        case countyName = "comuna_nombre"
        case storePhone = "local_telefono"
        case storeName = "local_nombre"
        case storeWorkDay = "funcionamiento_dia"
        case storeOpenTime = "funcionamiento_hora_apertura"
        case storeClosetime = "funcionamiento_hora_cierre"
        case storeAddress = "local_direccion"

        
    }
    var siteName: String
    var countyName: String
    var storePhone: String
    var storeName: String
    var storeWorkDay: String
    var storeOpenTime: String
    var storeClosetime: String
    var storeAddress: String
}
