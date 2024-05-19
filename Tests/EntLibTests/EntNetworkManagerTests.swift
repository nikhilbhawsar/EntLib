//
//  NetworkManagerTests.swift
//  EntFetcherTests
//
//  Created by Nikhil Bhawsar on 19/05/24.
//

import XCTest
@testable import EntLib

final class EntNetworkManagerTests: XCTestCase {

    func testGetRequest() throws {
        let expectation = self.expectation(description: "GET Request")
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
            XCTFail("Invalid URL")
            return
        }
        
        EntNetworkManager.shared.getRequest(url: url) { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data, "Data should not be nil")
            case .failure(let error):
                XCTFail("Request failed with error: \(error)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
