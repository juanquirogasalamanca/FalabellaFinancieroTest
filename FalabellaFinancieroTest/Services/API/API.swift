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
    func getRequest(requestURL: String , completion: @escaping (ServiceResponse<Category>) -> Void)
}

typealias HeadersResponse = [AnyHashable: Any]

enum ServiceResponse<Model> {
    case success(data: [StoreData])
    case failure(error: Error)
}

extension MVPPresenter {
      static func inject() -> APIProtocol {
        return API.instance
      }
  }

class API{
 
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
    
    func getRequest(requestURL: String , completion: @escaping (ServiceResponse<Category>) -> Void){
        AF.request(requestURL).responseJSON { response in
            if let data = response.data{
                do {
                        let decoder = JSONDecoder()
                        let dataResponse = try decoder.decode(ServerResponse.self, from: data)
                            completion(.success(data: dataResponse.result.stores))
                        } catch let error {
                            completion(.failure(error: error))
                      }
            } else {
                guard let error = response.error else { return }
                completion(.failure(error: error))
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



