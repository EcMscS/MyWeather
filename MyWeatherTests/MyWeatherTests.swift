//
//  MyWeatherTests.swift
//  MyWeatherTests
//
//  Created by Jeffrey Lai on 2/19/21.
//

import XCTest
@testable import MyWeather

class MyWeatherTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    override func setUp() {
        super.setUp()
        self.weather = WeatherModel()
    }
    
    private var weather: WeatherModel!
    
    func test_TimeCoversion() {
 
        //Unix Time: 1615426801
        //Human Time: 3/10/21 5:40:01 PM
        let unixTimeTest1 = 1615426801
        
        //Unix Time: 1619499999
        //Human Time: Monday, April 26,2021 10:06:39 PM
        let unixTimeTest2 = 1619499999
        
        let convertedTime1 = weather.convertFromUnixTimeToCurrentTime(time: unixTimeTest1)
        let convertedTime2 = weather.convertFromUnixTimeToCurrentTime(time: unixTimeTest2)
        
        XCTAssertEqual(convertedTime1, "5 PM")
        XCTAssertEqual(convertedTime2, "10 PM")
    }
    
    func test_FiveHourPeriod() {
        
        //Unix Time: 1615426801
        //Human Time: 3/10/21 5:40:01 PM
        //Result is [5 PM, 4 PM, 3 PM, 2 PM, 1 PM]
        let unixTimeTest1 = 1615426801
        
        
        //Unix Time: 1615419601
        //Human Time: 3/10/21 3:40:01 PM
        //Result is [3 PM, 2 PM, 1 PM, 12 PM, 11 AM]
        let unixTimeTest2 = 1615419601
        
        let convertedTimes1 = weather.fiveHourPeriod(time: unixTimeTest1)
        let convertedTimes2 = weather.fiveHourPeriod(time: unixTimeTest2)
        
        XCTAssertEqual(convertedTimes1, ["5 PM", "4 PM", "3 PM", "2 PM", "1 PM"])
        XCTAssertEqual(convertedTimes2, ["3 PM", "2 PM", "1 PM", "12 PM", "11 AM"])
    }
    
    func test_FiveDayPeriod() {
        
        //Unix Time: 1615426801
        //Human Time: Wednesday, 3/10/21 5:40:01 PM
        //Result is ["Wednesday", "Tuesday", "Monday", "Sunday", "Saturday"]
        let unixTimeTest1 = 1615426801
        
        //Unix Time: 1619499999
        //Human Time: Monday, April 26,2021 10:06:39 PM
        //Result is ["Monday", "Sunday", "Saturday", "Friday", "Thursday"]
        let unixTimeTest2 = 1619499999
        
        let convertedDays1 = weather.fiveDayPeriod(time: unixTimeTest1)
        let convertedDays2 = weather.fiveDayPeriod(time: unixTimeTest2)
        
        XCTAssertEqual(convertedDays1, ["Wednesday", "Tuesday", "Monday", "Sunday", "Saturday"])
        XCTAssertEqual(convertedDays2, ["Monday", "Sunday", "Saturday", "Friday", "Thursday"])
    }
    
    
    override func tearDown() {
        super.tearDown()
    }

}
