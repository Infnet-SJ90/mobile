//
//  SJ90Tests.swift
//  SJ90Tests
//
//  Created by Ronilson Batista on 23/09/2018.
//  Copyright © 2018 Ronilson Batista. All rights reserved.
//

import XCTest
@testable import SJ90

class SJ90Tests: XCTestCase {

    var rigisterControllerUnderTest: RegisterViewController!
    var mainViewControllerUnderTest: MainViewController!
    
    override func setUp() {
       
        self.rigisterControllerUnderTest = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.rigisterControllerUnderTest.loadView()
        self.rigisterControllerUnderTest.viewDidLoad()
        
        self.mainViewControllerUnderTest = MainViewController(nibName: "MainViewController", bundle: nil)
        self.mainViewControllerUnderTest.loadView()
        self.mainViewControllerUnderTest.viewDidLoad()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func registerViewControllerRestHasATableView() {
        XCTAssertNotNil(rigisterControllerUnderTest.tableView)
    }
    
    func registerViewControllerTestTableViewHasDelegate() {
        XCTAssertNotNil(rigisterControllerUnderTest.tableView.delegate)
    }
    
    func registerViewControllerTestTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(rigisterControllerUnderTest.conforms(to: UITableViewDelegate.self))
    }
    
    func registerViewControllerTestTableViewHasDataSource() {
        XCTAssertNotNil(rigisterControllerUnderTest.tableView.dataSource)
    }
    
    func registerViewControllerTestTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(mainViewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(mainViewControllerUnderTest.responds(to: #selector(mainViewControllerUnderTest.numberOfSections(in:))))
        XCTAssertTrue(mainViewControllerUnderTest.responds(to: #selector(mainViewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(mainViewControllerUnderTest.responds(to: #selector(mainViewControllerUnderTest.tableView(_:cellForRowAt:))))
    }
    
    func mainViewControllerRestHasATableView() {
        XCTAssertNotNil(mainViewControllerUnderTest.tableView)
    }
    
    func mainViewControllerTestTableViewHasDelegate() {
        XCTAssertNotNil(mainViewControllerUnderTest.tableView.delegate)
    }
    
    func mainViewControllerTestTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(mainViewControllerUnderTest.conforms(to: UITableViewDelegate.self))
    }
    
    func mainViewControllerTestTableViewHasDataSource() {
        XCTAssertNotNil(mainViewControllerUnderTest.tableView.dataSource)
    }
    
    func mainViewControllerTestTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(mainViewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(mainViewControllerUnderTest.responds(to: #selector(mainViewControllerUnderTest.numberOfSections(in:))))
        XCTAssertTrue(mainViewControllerUnderTest.responds(to: #selector(mainViewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(mainViewControllerUnderTest.responds(to: #selector(mainViewControllerUnderTest.tableView(_:cellForRowAt:))))
    }
}
