//
//  LoadListTest.swift
//  FalabellaFinancieroTestTests
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/14/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import XCTest
import Mockingjay
@testable import FalabellaFinancieroTest

class LoadListTest: XCTestCase {
    var sut: API?
    var mockStore: StoreData?
    var response : [StoreData]?
    var data: Data?
    
    override func setUp() {
        super.setUp()
        sut = API()
        mockStore = MockData.mockStore
        let url = Bundle(for: type(of: self)).url(forResource: "response", withExtension: "json")!
        data = try! Data(contentsOf: url)
        
        
    }

    override func tearDown() {
        sut = nil
        mockStore = nil
        super.tearDown()
    }

    func testLoadDataSuccess(){
//        given
        let expectation = self.expectation(description: "server's response")
        guard let _data = data else { return }
        stub(http(.get, uri: API.Constants.listDataURL), jsonData(_data))

//        when
        sut?.getRequest(requestURL: API.Constants.listDataURL, completion: { (response) in
            switch response{
                
            case .success(let data):
                self.response = data
            case .failure( _):
                break
            }
            expectation.fulfill()
        })
        
//        then
        waitForExpectations(timeout: 5) { (_) in
            XCTAssertEqual(self.response?.first, self.mockStore)
        }
       
    }

    func testLoadDataDecodeError(){
//        given
        let expectation = self.expectation(description: "server's bad Json response")
        let expectedError = "The data couldn’t be read because it is missing."
        let url = Bundle(for: type(of: self)).url(forResource: "badResponse", withExtension: "json")!
        data = try! Data(contentsOf: url)
        guard let _data = data else { return }
        stub(http(.get, uri: API.Constants.listDataURL), jsonData(_data))
        var errorResponse = ""
//        when
        sut?.getRequest(requestURL: API.Constants.listDataURL, completion: { (response) in
            switch response{
                
            case .success(_ ):
                break
            case .failure(let error):
                errorResponse = error.localizedDescription
            }
            expectation.fulfill()
        })
        
//        then
        waitForExpectations(timeout: 5) { (_) in
            XCTAssertEqual(errorResponse, expectedError)
        }
           
        }

        func testLoadDataHttpError(){
    //        given
            let expectation = self.expectation(description: "server's fail")
            let errorExpected  = "URLSessionTask failed with error: The operation couldn’t be completed. (Error error 404.)"
            let error = NSError(domain: "Error", code: 404, userInfo: nil)
            var errorResponse = ""
            stub(http(.get, uri: API.Constants.listDataURL),failure(error))
    //        when
            sut?.getRequest(requestURL: API.Constants.listDataURL, completion: { (response) in
                switch response{
                case .success( _):
                    break
                case .failure( let error):
                    errorResponse = error.localizedDescription
                }
                expectation.fulfill()
            })
            
    //        then
            waitForExpectations(timeout: 1) { (_) in
                XCTAssertEqual(errorExpected, errorResponse)
            }
           
        }

}
