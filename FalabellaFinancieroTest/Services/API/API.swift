//
//  API.swift
//  FalabellaFinancieroTest
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/13/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import Foundation
import Alamofire

protocol APIProtocol {
    func getRequest(requestURL: String , completion: @escaping ([StoreData]) -> Void)
}

extension MVPPresenter {
      static func inject() -> APIProtocol {
        return API.instance
      }
  }

final class API{
 
   static let instance = API()
    
    struct Constants{
        static let baseURL = "http://datos.gob.cl/api/action/datastore_search?resource_id=a60f93af-6a8a-45b6-85ff-267f5dd37ad6&"
        static let limitNumber = 5
        static let limit = "limit=\(limitNumber)"
        static let searchType = "q="
        static let listDataURL = baseURL + limit
        static let searchURL = baseURL + searchType
    }
    

}
extension API: APIProtocol{
    func getRequest(requestURL: String , completion: @escaping ([StoreData]) -> Void){
        AF.request(requestURL).responseJSON { response in
            guard let data = response.data else { return }
               do {
                   let decoder = JSONDecoder()
                   let dataResponse = try decoder.decode(ServerResponse.self, from: data)
                completion(dataResponse.result.stores)
               } catch let error {
                   print(error)
                   completion([])
               }
        }
    }
}

struct ServerResponse: Codable {
 
    var success: Bool
    var result: ResultContent
    
}

struct ResultContent: Codable{
    private enum CodingKeys: String, CodingKey {
        case stores = "records"
    }
    var stores: [StoreData]
}




