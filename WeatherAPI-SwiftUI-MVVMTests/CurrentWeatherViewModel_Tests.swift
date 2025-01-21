//
//  CurrentWeatherViewModel_Tests.swift
//  WeatherAPI-SwiftUI-MVVMTests
//
//  Created by Bhuiyan Wasif on 10/25/23.
//

import XCTest
@testable import WeatherAPI_SwiftUI_MVVM

class CurrentWeatherViewModel_Tests: XCTestCase {

    var systemUnderTest: CurrentWeatherViewModel!

    override func setUp() {
        systemUnderTest = CurrentWeatherViewModel(apiService: APIService())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSinkReceiveDataThenError() {
        // setup

        _ = systemUnderTest.$isErrorShown.sink { (value) in
            XCTAssertNotNil(value)
            XCTAssertEqual(value, false)
        }
                
        _ = systemUnderTest.$errorMessage.sink { (value) in
            XCTAssertNotNil(value)
            XCTAssertEqual(value, "")
        }
                
        _ = systemUnderTest.$isLoading.sink { (value) in
            XCTAssertNotNil(value)
            XCTAssertEqual(value, false)
        }
                
    }
    
    func testValidateSearchArray_Failure() {
        let _ = systemUnderTest.$errorMessage.sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(_):
              XCTAssertTrue(true)
            case .finished: break
            }
        }) { (value) in
            
        }
        systemUnderTest.searchText = "Dubai, Sharjah,"
        systemUnderTest.validateSearchArray()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
