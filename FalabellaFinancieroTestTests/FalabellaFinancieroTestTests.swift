//
//  FalabellaFinancieroTestTests.swift
//  FalabellaFinancieroTestTests
//
//  Created by Juan Guillermo Quiroga Salamanca on 5/12/20.
//  Copyright © 2020 Globant. All rights reserved.
//

import XCTest
@testable import FalabellaFinancieroTest

class FalabellaFinancieroTestTests: XCTestCase {
    var sut: LoginPresenter?
    var mockUser:Session?
    
    override func setUp() {
        super.setUp()
        sut = LoginPresenter()
        mockUser = MockData.mockUser
    }

    override func tearDown() {
        sut = nil
        mockUser = nil
        super.tearDown()
    }
    
    func testLoginUserSuccess(){
//        given
        sut?.validateUser(user: mockUser!.userName, password: mockUser!.password)
//        when
        let user = sut?.dataSession
//        then
        XCTAssertEqual(user, mockUser, "Login Success")
    }
    func testLoginUserFail(){
//        given
        sut?.validateUser(user: "", password: "")
//        when
        let user = sut?.dataSession
//        then
        XCTAssertNotEqual(user , mockUser, "Login Fail")
    }

}
