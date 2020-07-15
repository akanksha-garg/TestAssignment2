//
//  TestAssignmentTests.swift
//  TestAssignmentTests
//
//  Created by Akanksha garg on 12/07/20.
//  Copyright © 2020 Akanksha garg. All rights reserved.
//

import XCTest
@testable import TestAssignment

class TestAssignmentTests: XCTestCase {
    
    let viewModel = BlogViewModel()
    
    override func setUp() {
        viewModel.getJsonStaticFeeds()
    }
    
    func testVM() throws {
        
        XCTAssertTrue(viewModel.blogCount == 10)
        
        XCTAssertEqual(viewModel.blogData(0)?.commentsCount, 8237)
        XCTAssertEqual(viewModel.blogData(1)?.likesCount, 71738)
        
        
        let media = viewModel.blogData(1)?.media?[0]
        XCTAssertEqual(media?.blogUrl , "https://alexandro.name")
        
        let user = viewModel.blogData(1)?.user?[0]
        XCTAssertEqual(user?.designation , "Central Intranet Developer")
        XCTAssertNotEqual(viewModel.blogData(9)?.likesCount, 97000)
        
        let firstName =  try XCTUnwrap(user?.firstName)
        XCTAssertFalse(firstName.isEmpty)
    }
    
    func testBlogTimeStamp() {
        let value = viewModel.blogTimeStamp(0)
        XCTAssertEqual(value, "87 days")
    }
    
    func testBlogData() {
        let value = viewModel.blogData(0)
        XCTAssertEqual(value?.commentsCount, 8237)
    }
}
