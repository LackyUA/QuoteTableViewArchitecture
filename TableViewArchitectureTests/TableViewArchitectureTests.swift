//
//  TableViewArchitectureTests.swift
//  TableViewArchitectureTests
//
//  Created by Dima Dobrovolskyy on 5/16/19.
//  Copyright © 2019 Dima Dobrovolskyy. All rights reserved.
//

import XCTest
@testable import TableViewArchitecture

class TableViewArchitectureTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testNetworkRequest() {
        let json = """
        {
            "quote" : "There is only one way to avoid criticism: do nothing, say nothing, and be nothing.",
            "author" : "Aristotle",
            "imageUrl" : "http://bit.do/eSxm9"
        }
        """
        
        guard let jsonData = json.data(using: .utf8) else { return }
        let decoder = JSONDecoder()
        
        guard let quote = try? decoder.decode(Quote.self, from: jsonData) else { return }
        
        XCTAssertEqual(quote.author, "Aristotle")
        XCTAssertEqual(quote.quote, "There is only one way to avoid criticism: do nothing, say nothing, and be nothing.")
        XCTAssertEqual(quote.imageUrl, URL(string: "http://bit.do/eSxm9"))
    }

}
